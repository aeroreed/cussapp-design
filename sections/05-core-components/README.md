# Core Components Sub-Sections

This directory contains the detailed documentation for each of the four core components of the CUSS application.

## File Structure

```
05-core-components/
├── workflow-engine.adoc     # 5.1 - Execution engine and state management
├── workflow-builder.adoc    # 5.2 - Visual workflow design interface  
├── dsl.adoc                 # 5.3 - Domain-Specific Language
└── workflow-player.adoc     # 5.4 - Vue3 browser-based rendering
```

## Benefits of This Structure

✅ **Easier Navigation**: Each component has its own focused file
✅ **Better Collaboration**: Multiple people can work on different components
✅ **Cleaner Git Diffs**: Changes are isolated to specific components
✅ **Faster Editing**: Smaller files load and save faster
✅ **Logical Organization**: Clear separation of component documentation

## Content Overview

### workflow-engine.adoc
- Workflow execution model
- State management
- Event handling
- JSON workflow definitions
- Performance considerations

### workflow-builder.adoc  
- Visual design interface
- WYSIWYG editor wireframes
- DSL binding panels
- Configuration management
- Multi-airline support

### dsl.adoc
- Complete DSL command reference
- Event binding examples
- Parameter substitution
- Error handling patterns
- Advanced features

### workflow-player.adoc
- Vue3 architecture
- WebView2 integration
- Component rendering
- State management (Vuex)
- Accessibility features

## Editing Guidelines

1. **Edit individual files** for specific component changes
2. **Keep cross-references** between components when relevant
3. **Use consistent section numbering** (5.1.x, 5.2.x, etc.)
4. **Include code examples** for technical concepts
5. **Add TODO comments** for future enhancements

## Build Process

The main `05-core-components.adoc` file automatically includes all sub-files using:

```asciidoc
include::05-core-components/workflow-engine.adoc[]
include::05-core-components/workflow-builder.adoc[]
include::05-core-components/dsl.adoc[]
include::05-core-components/workflow-player.adoc[]
```

This creates a seamless document while maintaining modular source files.