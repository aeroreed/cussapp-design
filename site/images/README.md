# Images Directory Structure

This directory contains all images, diagrams, and visual assets for the CUSS App Design Documentation.

## Directory Organization

- `architecture/` - System architecture diagrams, component diagrams
- `ui/` - User interface mockups, screenshots, wireframes  
- `diagrams/` - Flow charts, sequence diagrams, process flows

## Supported Image Formats

AsciiDoc supports:
- PNG (recommended for screenshots and diagrams)
- JPEG/JPG (for photos)
- SVG (recommended for scalable diagrams)
- GIF

## Usage in AsciiDoc

Since `:imagesdir: images` is configured in index.adoc, you can reference images like:

```asciidoc
// Basic image
image::architecture/system-overview.png[]

// Image with caption and sizing
image::ui/login-screen.png[Login Screen, 600, 400]

// Inline image
Here is an icon: image:icons/warning.png[Warning, 16, 16]
```

## Best Practices

1. Use descriptive filenames (e.g., `cuss-architecture-overview.png`)
2. Keep file sizes reasonable for web display
3. Use SVG for diagrams that need to scale
4. Organize by category using subdirectories
5. Include alt text for accessibility

## Tools for Creating Diagrams

- **Draw.io / diagrams.net** - Free online diagramming tool
- **Lucidchart** - Professional diagramming
- **PlantUML** - Text-based UML diagrams
- **Mermaid** - Markdown-inspired diagram syntax
- **Visio** - Microsoft diagramming tool
- **Figma** - UI/UX design and wireframing