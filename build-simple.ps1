# Simple AsciiDoc to HTML Build Script for GitHub Pages

# Install asciidoctor if not already installed
if (!(Get-Command asciidoctor -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Asciidoctor..."
    gem install asciidoctor
}

# Create output directory
if (!(Test-Path "docs")) {
    New-Item -ItemType Directory -Path "docs"
}

# Copy styles directory to docs if it exists
if (Test-Path "styles") {
    Write-Host "📁 Copying styles directory..."
    Copy-Item -Path "styles" -Destination "docs" -Recurse -Force
}

# Copy images directory to docs if it exists
if (Test-Path "images") {
    Write-Host "🖼️ Copying images directory..."
    Copy-Item -Path "images" -Destination "docs" -Recurse -Force
}

Write-Host "🔧 Converting AsciiDoc to HTML..."

# Convert main documentation file
asciidoctor `
    --destination-dir docs `
    --out-file index.html `
    --attribute toc=left `
    --attribute toclevels=3 `
    --attribute sectlinks `
    --attribute sectanchors `
    --attribute sectnums `
    --attribute icons=font `
    --attribute source-highlighter=highlight.js `
    index.adoc

if ($?) {
    Write-Host "✅ Documentation built successfully!"
    Write-Host "📁 Output: docs/index.html"
    Write-Host "🌐 Ready for GitHub Pages!"
    Write-Host ""
    Write-Host "Next steps:"
    Write-Host "1. Commit and push to GitHub"
    Write-Host "2. Enable GitHub Pages in repository settings"
    Write-Host "3. Set source to 'docs' folder"
} else {
    Write-Host "❌ Build failed!"
    exit 1
}