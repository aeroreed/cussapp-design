# CUSS App Design Documentation

A simple, clean documentation project for CUSS (Common Use Self Service) application design using AsciiDoc and GitHub Pages.

## 🚀 Quick Start

This project uses AsciiDoc to create professional documentation with:
- ✅ Numbered sections
- ✅ Table of contents (TOC) with jump links
- ✅ Cross-references and links
- ✅ GitHub Pages hosting
- ✅ Automatic builds via GitHub Actions

## 📝 Writing Documentation

The main documentation is in `index.adoc`. AsciiDoc provides:

- **Automatic TOC**: `toc: left` in the header
- **Section numbering**: `sectnums:` attribute
- **Jump links**: `sectlinks:` and `sectanchors:` attributes
- **Professional formatting**: Built-in styles and typography

### Sample AsciiDoc Syntax:

```asciidoc
= Document Title
:toc: left
:sectnums:

== Chapter 1
Content here...

=== Section 1.1
More content...

==== Subsection 1.1.1
Even more content...
```

## 🔨 Building Locally

### Prerequisites
- Ruby with RubyGems
- Asciidoctor gem

### Install Asciidoctor
```bash
gem install asciidoctor
```

### Build Documentation
```powershell
.\build-simple.ps1
```

This creates `docs/index.html` ready for GitHub Pages.

## 🌐 GitHub Pages Setup

1. **Push to GitHub**: Commit and push your changes
2. **Enable Pages**: Go to Settings > Pages in your GitHub repository
3. **Configure Source**: 
   - Source: "Deploy from a branch"
   - Branch: `main` or `master`
   - Folder: `/docs`

Or use the included GitHub Actions workflow for automatic deployment.

## 📁 Project Structure

```
├── index.adoc              # Main documentation source
├── build-simple.ps1        # Local build script
├── docs/                   # Generated HTML (for GitHub Pages)
│   └── index.html
└── .github/workflows/      # Automatic GitHub Actions deployment
    └── deploy.yml
```

## ✨ Features

- **Clean, professional output**: No complex build system
- **Fast and reliable**: Simple AsciiDoc to HTML conversion
- **Mobile-friendly**: Responsive design
- **Search-friendly**: Semantic HTML with proper headings
- **Accessible**: WCAG compliant output
- **Version controlled**: Full history in Git

## 🔄 Workflow

1. Edit `index.adoc`
2. Run `.\build-simple.ps1` to test locally
3. Commit and push to GitHub
4. GitHub Pages automatically updates

## 📚 AsciiDoc Resources

- [AsciiDoc Syntax Quick Reference](https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/)
- [AsciiDoctor User Manual](https://docs.asciidoctor.org/asciidoc/latest/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

## 🎯 Why This Approach?

- ✅ **Simple**: No complex build systems or dependencies
- ✅ **Reliable**: Works consistently across environments
- ✅ **Fast**: Quick builds and updates
- ✅ **Professional**: High-quality output suitable for technical documentation
- ✅ **Maintainable**: Easy to edit and update content
- ✅ **Free hosting**: GitHub Pages at no cost