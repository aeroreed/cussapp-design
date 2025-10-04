# Add New Section Script
# Usage: .\add-section.ps1 -SectionNumber 8 -SectionName "new-topic"

param(
    [Parameter(Mandatory=$true)]
    [int]$SectionNumber,
    
    [Parameter(Mandatory=$true)]
    [string]$SectionName,
    
    [string]$SectionTitle
)

# Generate section title if not provided
if (-not $SectionTitle) {
    $SectionTitle = ($SectionName -split '-' | ForEach-Object { 
        $_.Substring(0,1).ToUpper() + $_.Substring(1).ToLower() 
    }) -join ' '
}

$SectionFile = "sections\$($SectionNumber.ToString('00'))-$SectionName.adoc"
$SectionDir = "sections\$($SectionNumber.ToString('00'))-$SectionName"

Write-Host "🆕 Creating new section: $SectionNumber. $SectionTitle"

# Create main section file
$MainContent = @"
== $SectionNumber. $SectionTitle

Brief overview of the $SectionTitle section and its purpose.

// TODO: Add overview content and subsection table if needed

// Include subsections (add as needed)
// include::$($SectionNumber.ToString('00'))-$SectionName/subsection-1.adoc[]

"@

$MainContent | Out-File -FilePath $SectionFile -Encoding UTF8
Write-Host "✅ Created main section file: $SectionFile"

# Create subsection directory
New-Item -ItemType Directory -Path $SectionDir -Force | Out-Null
Write-Host "✅ Created subsection directory: $SectionDir"

# Create README for subsections
$ReadmeContent = @"
# $SectionTitle Sub-Sections

This directory contains the detailed documentation for the $SectionTitle section.

## File Structure

\`\`\`
$($SectionNumber.ToString('00'))-$SectionName/
├── README.md                    # This file
└── (subsection files go here)
\`\`\`

## Adding Subsections

To add a new subsection:

1. Create file: \`$SectionName-subsection.adoc\`
2. Add include to main file: \`include::$($SectionNumber.ToString('00'))-$SectionName/subsection.adoc[]\`
3. Build and test: \`.\build-simple.ps1\`

## Subsection Template

\`\`\`asciidoc
=== $SectionNumber.X Subsection Name

Content for this subsection...

==== $SectionNumber.X.1 First Topic

Detailed content...
\`\`\`
"@

$ReadmeContent | Out-File -FilePath "$SectionDir\README.md" -Encoding UTF8
Write-Host "✅ Created subsection README: $SectionDir\README.md"

# Update index.adoc (add include statement)
$IndexPath = "index.adoc"
$IndexContent = Get-Content $IndexPath -Raw

# Find the last include statement and add new one after it
$Pattern = "(include::sections\/\d+-[^]]+\.adoc\[\])"
$NewInclude = "`ninclude::sections/$($SectionNumber.ToString('00'))-$SectionName.adoc[]"

if ($IndexContent -match $Pattern) {
    $LastMatch = [regex]::Matches($IndexContent, $Pattern) | Select-Object -Last 1
    $InsertPosition = $LastMatch.Index + $LastMatch.Length
    $UpdatedContent = $IndexContent.Insert($InsertPosition, $NewInclude)
    $UpdatedContent | Out-File -FilePath $IndexPath -Encoding UTF8 -NoNewline
    Write-Host "✅ Added include statement to index.adoc"
} else {
    Write-Host "⚠️  Please manually add this line to index.adoc:"
    Write-Host "   include::sections/$($SectionNumber.ToString('00'))-$SectionName.adoc[]"
}

Write-Host ""
Write-Host "🎉 Section $SectionNumber created successfully!"
Write-Host "📝 Next steps:"
Write-Host "   1. Edit $SectionFile to add content"
Write-Host "   2. Add subsections to $SectionDir as needed"
Write-Host "   3. Run .\build-simple.ps1 to test"
Write-Host "   4. Commit changes with git"