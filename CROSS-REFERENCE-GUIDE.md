# Cross-Reference Guide for CUSS Documentation

## How to Create Links to Glossary Terms

### 1. **Add Anchors to Glossary Entries**

In `sections/10-appendices.adoc`:

```asciidoc
[[glossary-webview2]]
**WebView2**:: Microsoft's embedded web browser control...

[[glossary-cuss]]
**CUSS**:: Common Use Self Service
```

### 2. **Link to Glossary from Content**

In any section file:

```asciidoc
The app uses <<glossary-webview2,WebView2>> for rendering.
We follow <<glossary-cuss,CUSS>> standards.
```

### 3. **Add Return Links (Optional)**

In the glossary entry:

```asciidoc
[[glossary-webview2]]
**WebView2**:: Definition here... +
<<introduction,↩ Return to Introduction>>
```

## Syntax Reference

| Syntax | Result |
|--------|--------|
| `<<glossary-webview2,WebView2>>` | Creates a link to glossary with "WebView2" as link text |
| `<<glossary-webview2>>` | Creates a link using the section title as link text |
| `[[anchor-name]]` | Creates an anchor point for linking |
| `<<anchor-name,Link Text>>` | Links to an anchor with custom text |

## Examples

### Linking to Different Sections

```asciidoc
See the <<system-architecture,System Architecture>> section.
For security details, refer to <<security-requirements>>.
```

### Cross-References with Custom Text

```asciidoc
The <<glossary-dcs,Departure Control System>> integration...
Using <<glossary-webview2,Microsoft WebView2>> technology...
```

### Multi-directional Links

```asciidoc
// In content:
Built with <<glossary-webview2,WebView2>> technology.

// In glossary:
[[glossary-webview2]]
**WebView2**:: Browser control technology +
<<system-architecture,↩ Back to Architecture>> | <<introduction,↩ Back to Introduction>>
```

## Best Practices

✅ Use descriptive anchor names: `glossary-webview2`, not `wv2`
✅ Add return links for better navigation
✅ Use consistent link text for the same terms
✅ Keep glossary definitions concise but complete
❌ Don't overuse links - only link important terms
❌ Don't create circular references