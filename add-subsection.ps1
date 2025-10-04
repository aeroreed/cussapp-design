# Add Subsection Script
# Usage: .\add-subsection.ps1 -SectionNumber 5 -SubsectionName "new-component"

param(
    [Parameter(Mandatory=$true)]
    [int]$SectionNumber,
    
    [Parameter(Mandatory=$true)]
    [string]$SubsectionName,
    
    [string]$SubsectionTitle,
    
    [int]$SubsectionIndex = 1
)

# Generate subsection title if not provided
if (-not $SubsectionTitle) {
    $SubsectionTitle = ($SubsectionName -split '-' | ForEach-Object { 
        $_.Substring(0,1).ToUpper() + $_.Substring(1).ToLower() 
    }) -join ' '
}

$SectionDir = "sections\$($SectionNumber.ToString('00'))-*"
$SectionDirs = Get-ChildItem -Path $SectionDir -Directory

if ($SectionDirs.Count -eq 0) {
    Write-Host "❌ No subsection directory found for section $SectionNumber"
    Write-Host "   Expected directory pattern: $SectionDir"
    exit 1
}

if ($SectionDirs.Count -gt 1) {
    Write-Host "⚠️  Multiple directories found for section $SectionNumber"
    $SectionDirs | ForEach-Object { Write-Host "   $_" }
    Write-Host "Please specify the exact directory name."
    exit 1
}

$SectionDirPath = $SectionDirs[0].FullName
$SectionDirName = $SectionDirs[0].Name
$SubsectionFile = "$SectionDirPath\$SubsectionName.adoc"

Write-Host "🆕 Creating new subsection: $SectionNumber.$SubsectionIndex $SubsectionTitle"

# Create subsection file
$SubsectionContent = @"
=== $SectionNumber.$SubsectionIndex $SubsectionTitle

Brief introduction to the $SubsectionTitle subsection.

==== $SectionNumber.$SubsectionIndex.1 Overview

Content for the first topic in this subsection...

==== $SectionNumber.$SubsectionIndex.2 Implementation

Content for implementation details...

// TODO: Add detailed content about:
// - Specific topic 1
// - Specific topic 2
// - Additional features
"@

$SubsectionContent | Out-File -FilePath $SubsectionFile -Encoding UTF8
Write-Host "✅ Created subsection file: $SubsectionFile"

# Update main section file (add include statement)
$MainSectionFile = "sections\$SectionDirName.adoc"

if (Test-Path $MainSectionFile) {
    $MainContent = Get-Content $MainSectionFile -Raw
    $NewInclude = "`ninclude::$SectionDirName/$SubsectionName.adoc[]"
    
    # Add include before the closing of the file
    if ($MainContent -notmatch "include::$SectionDirName/$SubsectionName\.adoc\[\]") {
        $MainContent += $NewInclude
        $MainContent | Out-File -FilePath $MainSectionFile -Encoding UTF8 -NoNewline
        Write-Host "✅ Added include statement to $MainSectionFile"
    } else {
        Write-Host "ℹ️  Include statement already exists in $MainSectionFile"
    }
} else {
    Write-Host "⚠️  Main section file not found: $MainSectionFile"
    Write-Host "   Please manually add this line to the main section file:"
    Write-Host "   include::$SectionDirName/$SubsectionName.adoc[]"
}

# Update subsection README
$ReadmePath = "$SectionDirPath\README.md"
if (Test-Path $ReadmePath) {
    $ReadmeContent = Get-Content $ReadmePath -Raw
    $FileListPattern = "(?s)(## File Structure.*?```.*?)(```)"
    $NewFileEntry = "├── $SubsectionName.adoc`r`n"
    
    if ($ReadmeContent -match $FileListPattern) {
        $UpdatedReadme = $ReadmeContent -replace $FileListPattern, "`$1$NewFileEntry`$2"
        $UpdatedReadme | Out-File -FilePath $ReadmePath -Encoding UTF8 -NoNewline
        Write-Host "✅ Updated subsection README"
    }
}

Write-Host ""
Write-Host "🎉 Subsection created successfully!"
Write-Host "📝 Next steps:"
Write-Host "   1. Edit $SubsectionFile to add content"
Write-Host "   2. Update subsection numbering if needed"
Write-Host "   3. Run .\build-simple.ps1 to test"
Write-Host "   4. Commit changes with git"