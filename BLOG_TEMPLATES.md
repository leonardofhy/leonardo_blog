# Blog Templates

This document explains how to use the available blog templates for creating new posts.

## Available Templates

### Default Template (`default.md`)
Use for general blog posts and announcements.
```bash
hugo new content/posts/my-new-post.md
```

### Tutorial Template (`tutorial.md`)
Use for technical guides, how-to posts, and educational content.
```bash
hugo new --kind tutorial content/posts/my-tutorial.md
```

Features:
- Prerequisites section
- Learning objectives
- Step-by-step structure
- Code examples
- Common issues and solutions
- Resources and next steps

### Experience Template (`experience.md`)
Use for sharing lessons learned, project experiences, and retrospectives.
```bash
hugo new --kind experience content/posts/my-experience.md
```

Features:
- Background and context
- Challenges and solutions structure
- Key lessons learned
- Recommendations section
- Metrics and results

### Project Template (`project.md`)
Use for showcasing projects and technical work.
```bash
hugo new --kind project content/posts/my-project.md
```

Features:
- Project overview and demo links
- Tech stack details
- Implementation highlights
- Development process
- Installation instructions
- Future improvements

## Front Matter Fields

All templates include these standard fields:

- `title`: Post title (auto-generated from filename)
- `date`: Creation date (auto-generated)
- `draft`: Set to `true` initially, change to `false` to publish
- `tags`: Array of relevant tags
- `categories`: Post category
- `author`: Set to "Leonardo Foo" by default
- `summary`: Brief description for listings and SEO

## Best Practices

1. **Choose the right template**: Pick the template that best matches your content type
2. **Fill in the summary**: Always provide a meaningful summary for better SEO
3. **Update tags and categories**: Use relevant tags and choose appropriate categories
4. **Remove placeholder text**: Replace all `[placeholder]` text with actual content
5. **Set draft to false**: Remember to set `draft: false` when ready to publish

## Custom Categories

Use these categories consistently:
- `General` - General posts and announcements
- `Tutorial` - How-to guides and tutorials
- `Experience` - Lessons learned and experience sharing
- `Projects` - Project showcases
- `AI & Machine Learning` - AI/ML related content
- `Web Development` - Web development topics

## Example Usage

```bash
# Create a new tutorial about Python
hugo new --kind tutorial content/posts/python-basics-tutorial.md

# Create an experience post about learning React
hugo new --kind experience content/posts/learning-react-journey.md

# Create a project showcase
hugo new --kind project content/posts/my-awesome-app.md

# Create a general blog post
hugo new content/posts/thoughts-on-technology.md
```

## Template Customization

Templates are located in `archetypes/` directory:
- `archetypes/default.md` - Default template
- `archetypes/tutorial.md` - Tutorial template
- `archetypes/experience.md` - Experience template
- `archetypes/project.md` - Project template

Feel free to modify these templates to better suit your needs, but maintain the front matter structure for consistency.