# Sections Directory

This directory contains modular AsciiDoc files for each major section of the CUSS App Design Documentation.

## New Nested Structure Pattern

Starting with Section 5, all major sections follow a **nested structure** for better organization:

```
sections/
├── XX-section-name.adoc              # Main section (overview + includes)
└── XX-section-name/                  # Subsection directory
    ├── subsection-1.adoc             # Individual subsection files
    ├── subsection-2.adoc
    ├── subsection-3.adoc
    └── README.md                     # Subsection guide
```

## Current File Organization

### Single-File Sections (Legacy)
- `01-introduction.adoc` - Introduction and project scope
- `02-its-a-cuss-app.adoc` - CUSS specification compliance and local runtime justification
- `03-user-interface-design.adoc` - UI design principles and screen flows
- `04-security-requirements.adoc` - Security and data protection requirements

### Nested Structure Sections (New Pattern)
- `05-core-components.adoc` + `05-core-components/` - Core application components
- `06-deployment-update-strategy.adoc` - .NET Core deployment strategy  
- `07-appendices.adoc` - Glossary and references

## Adding New Sections

### Automated Approach (Recommended)
```powershell
# Add new section
.\add-section.ps1 -SectionNumber 8 -SectionName "integration-apis"

# Add subsection to existing section
.\add-subsection.ps1 -SectionNumber 5 -SubsectionName "event-bus"
```

### Manual Approach
1. Create main section file: `sections/XX-section-name.adoc`
2. Create subsection directory: `sections/XX-section-name/`
3. Add include statement to `index.adoc`
4. Follow template in `DOCUMENTATION-STRUCTURE-GUIDE.md`

## Benefits of Nested Structure

✅ **Better Collaboration**: Multiple people can work on different subsections
✅ **Cleaner Version Control**: Changes isolated to specific files
✅ **Easier Maintenance**: Smaller, focused files
✅ **Improved Navigation**: Quick location of specific content
✅ **Scalable Organization**: Easy to add/remove subsections
✅ **Faster Editing**: Smaller files load and save faster

## Migration Strategy

Current single-file sections will be migrated to nested structure when:
- Section grows beyond 200 lines
- Multiple people need to work on the section
- Content becomes logically distinct
- Subsections become substantial (100+ lines each)

## Usage Guidelines

### When to Use Nested Structure
- ✅ Section has 3+ major subsections
- ✅ Subsections are substantial (100+ lines)
- ✅ Multiple contributors work on the section
- ✅ Content is logically distinct

### When to Keep Single File
- ❌ Section has 1-2 simple subsections
- ❌ Total content under 200 lines
- ❌ Tightly coupled content
- ❌ Rarely updated content

## Cross-References

Link between sections using AsciiDoc cross-reference syntax:
```asciidoc
<<section-anchor,Display Text>>
See <<glossary-webview2,WebView2>> for details
```

## Building

The build script automatically processes all includes and generates the final HTML:
```powershell
.\build-simple.ps1
```