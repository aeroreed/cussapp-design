# Documentation Structure Guidelines

## Nested Section Pattern

All major sections should follow this standardized nested structure for better organization and maintainability.

## Standard Structure Template

```
sections/
├── XX-section-name.adoc              # Main section file (overview + includes)
└── XX-section-name/                  # Subsection directory
    ├── subsection-1.adoc             # Individual subsection files
    ├── subsection-2.adoc
    ├── subsection-3.adoc
    └── README.md                     # Subsection documentation guide
```

## Example: Section 5 (Core Components)

```
sections/
├── 05-core-components.adoc           # Main section overview
└── 05-core-components/               # Nested subsections
    ├── workflow-engine.adoc          # 5.1 Workflow Engine
    ├── workflow-builder.adoc         # 5.2 Workflow Builder  
    ├── dsl.adoc                      # 5.3 Domain-Specific Language
    ├── workflow-player.adoc          # 5.4 Workflow Player
    └── README.md                     # Component guide
```

## Main Section File Template

```asciidoc
== X. Section Name

Brief overview of the section and its purpose.

.Component/Topic Overview (optional table)
[cols="1,3,6"]
|===
| Topic | Purpose | Description
| Topic 1 | Brief purpose | Detailed description
| Topic 2 | Brief purpose | Detailed description
|===

// Include all subsections
include::XX-section-name/subsection-1.adoc[]

include::XX-section-name/subsection-2.adoc[]

include::XX-section-name/subsection-3.adoc[]
```

## Subsection File Template

```asciidoc
=== X.Y Subsection Name

Brief introduction to this subsection.

==== X.Y.1 First Topic

Content for the first topic...

==== X.Y.2 Second Topic

Content for the second topic...

[source,language]
----
// Code examples when relevant
----

// TODO: Add content about:
// - Future topic 1
// - Future topic 2
```

## Benefits of This Pattern

✅ **Modular Organization**: Each subsection is in its own file
✅ **Better Collaboration**: Multiple people can work simultaneously
✅ **Cleaner Git Diffs**: Changes isolated to specific files
✅ **Easier Navigation**: Quick location of specific content
✅ **Scalable Structure**: Easy to add/remove subsections
✅ **Faster Editing**: Smaller files load and save faster

## Implementation Process

### Adding a New Section

1. **Create main section file**: `sections/XX-new-section.adoc`
2. **Create subsection directory**: `sections/XX-new-section/`
3. **Add to index.adoc**: `include::sections/XX-new-section.adoc[]`
4. **Create README.md** in subsection directory
5. **Build and test**: `.\build-simple.ps1`

### Adding a Subsection to Existing Section

1. **Create subsection file**: `sections/XX-section/new-subsection.adoc`
2. **Add include statement** to main section file
3. **Update subsection README.md**
4. **Build and test**: `.\build-simple.ps1`

## Naming Conventions

### Section Files
- Format: `XX-section-name.adoc`
- Example: `05-core-components.adoc`

### Subsection Files  
- Format: `descriptive-name.adoc`
- Example: `workflow-engine.adoc`

### Subsection Directories
- Format: `XX-section-name/`
- Example: `05-core-components/`

## Section Numbering

- **Main sections**: Use level 2 headings (`== X. Section Name`)
- **Subsections**: Use level 3 headings (`=== X.Y Subsection Name`)
- **Sub-subsections**: Use level 4 headings (`==== X.Y.Z Topic Name`)

## Cross-References

- **Link to subsection**: `<<section-anchor,Display Text>>`
- **Link to main section**: `See section 5 for details`
- **Link to glossary**: `<<glossary-term,Term>>`

## File Management

### When to Use Nested Structure
- ✅ Section has 3+ major subsections
- ✅ Subsections are substantial (100+ lines)
- ✅ Multiple people work on the section
- ✅ Content is logically distinct

### When to Keep Single File
- ❌ Section has 1-2 simple subsections
- ❌ Total content under 200 lines
- ❌ Tightly coupled content
- ❌ Rarely updated content

## Build Considerations

- **AsciiDoc includes**: Processed at build time, not runtime
- **Relative paths**: Includes use relative paths from main file
- **Asset copying**: Images and styles copied automatically
- **Error handling**: Build fails if include file missing

## Conversion Process for Existing Sections

1. **Identify subsections** in current single file
2. **Create directory** for nested structure
3. **Extract content** to individual subsection files
4. **Create main file** with includes
5. **Test build** to ensure everything works
6. **Update cross-references** as needed

This pattern ensures consistency, maintainability, and scalability across all documentation sections.