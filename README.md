# Leonardo's Notes

Welcome to Leonardo's personal blog - a collection of thoughts, insights, and technical notes on AI, technology, and software development. Built with [Hugo](https://gohugo.io/) and automatically deployed to GitHub Pages.

## 🌐 Site Access

The blog is live at: **https://leonardofhy.github.io/leonardo_blog**

> **Note**: If you experience redirects to an inaccessible domain, please use the direct GitHub Pages URL above. The repository owner may need to update the custom domain settings in the GitHub Pages configuration.

The site is automatically deployed via GitHub Actions whenever changes are pushed to the `main` branch.

## 🛠️ Local Development Setup

This blog uses Hugo with the PaperMod theme. Follow these steps to set up your local development environment.

### Prerequisites

1. **Install Hugo Extended** (v0.130.0 or higher required for PaperMod theme):
   
   **macOS:**
   ```bash
   brew install hugo
   ```
   
   **Linux/WSL:**
   ```bash
   # Download the latest extended version
   # Visit https://github.com/gohugoio/hugo/releases to find the latest version.
   # Replace <VERSION> with the latest version number (v0.130.0 or higher required)
   wget https://github.com/gohugoio/hugo/releases/download/v<VERSION>/hugo_extended_<VERSION>_linux-amd64.tar.gz
   tar -xzf hugo_extended_<VERSION>_linux-amd64.tar.gz
   sudo mv hugo /usr/local/bin/
   ```
   
   **Windows:**
   ```bash
   choco install hugo-extended
   ```

2. **Clone the repository** (with submodules for the theme):
   ```bash
   git clone --recurse-submodules https://github.com/leonardofhy/leonardo_blog.git
   cd leonardo_blog
   ```

### Running Locally

Start the development server:
```bash
hugo server --buildDrafts
```

The site will be available at `http://localhost:1313` with live reload enabled.

## ✍️ Creating New Content

### Create a New Blog Post

1. **Using Hugo's archetype system**:
   ```bash
   hugo new content/posts/my-new-post.md
   ```

2. **Manual creation** - Create a new `.md` file in `content/posts/` with this front matter:
   ```yaml
   ---
   title: "Your Post Title"
   date: 2025-01-20T14:55:00+08:00
   draft: false
   tags: ["tag1", "tag2"]
   categories: ["Category"]
   author: "Leonardo Foo"
   summary: "Brief description of your post"
   ---
   
   Your content goes here...
   ```

### Front Matter Fields

Each blog post requires these YAML front matter fields:

- `title`: Post title (appears in browser tab and post header)
- `date`: Publication date in ISO format with timezone (e.g., 2025-01-20T14:55:00+08:00)
- `draft`: Set to `false` to publish, `true` to keep as draft
- `tags`: Array of tags for content categorization and filtering
- `categories`: Array of categories for content organization
- `author`: Author name (use "Leonardo Foo" for consistency)
- `summary`: Brief description shown in post listings and search results

### Writing Content

- Use standard Markdown syntax
- Place images in `static/images/` and reference them as `/images/filename.jpg`
- Posts support Hugo's shortcodes for enhanced functionality

## 🚀 Publishing Content

### Automatic Deployment

Changes are automatically deployed when you:

1. **Commit and push** to the `main` branch:
   ```bash
   git add .
   git commit -m "Add new post about [topic]"
   git push origin main
   ```

2. **GitHub Actions** will automatically:
   - Build the Hugo site
   - Deploy to GitHub Pages
   - Make it live at the site URL

### Manual Build (Optional)

To build the site locally:
```bash
hugo --minify
```

This creates a `public/` directory with the static site files.

## 📁 Project Structure

```
leonardo_blog/
├── archetypes/          # Content templates
│   └── default.md       # Default post template
├── content/             # Site content
│   └── posts/           # Blog posts
├── layouts/             # Custom layout overrides
├── static/              # Static files (images, etc.)
├── themes/              # Hugo themes
│   └── PaperMod/        # Current theme (git submodule)
├── hugo.toml            # Site configuration
└── README.md            # This file
```

## ⚙️ Configuration

Site settings are configured in `hugo.toml`:

- **baseURL**: Site URL for deployment
- **title**: Site title shown in browser
- **theme**: Hugo theme being used
- **params**: Theme-specific settings and social links

## 🎨 Theme & Features

This blog uses the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme, which provides:

- **Clean, minimal design** optimized for reading
- **Dark/light mode toggle** for user preference
- **Mobile responsive layout** that works on all devices  
- **Fast loading times** with optimized performance
- **SEO optimized** with proper meta tags and structured data
- **Social sharing** integration
- **Table of contents** generation for long posts
- **Search functionality** across all content

### Customizations

- Custom Google Analytics integration (in `layouts/partials/`)
- Bilingual content support (English and Chinese)
- Optimized for technical content with code highlighting

## 📝 Content Creation Tips

1. **Preview drafts**: Use `hugo server --buildDrafts` to see draft posts locally
2. **Organize content**: Use categories and tags consistently for better navigation
3. **SEO friendly**: Write descriptive summaries and titles for better search visibility
4. **Image optimization**: Keep images under 1MB and use web-friendly formats (WebP, JPEG)
5. **Markdown structure**: Use proper heading hierarchy (H1 → H2 → H3) for accessibility
6. **Bilingual support**: The blog supports both English (English) and Chinese (中文) content
7. **Code highlighting**: Use fenced code blocks with language specification for syntax highlighting
8. **Internal linking**: Link between posts using relative URLs for better site cohesion

## 🔧 Troubleshooting

### Common Issues

**Theme not loading or build fails?**
```bash
# Update git submodules to get the latest theme
git submodule update --init --recursive
```

**Hugo version compatibility issues?**
- Ensure you're using Hugo Extended version v0.130.0 or higher
- The PaperMod theme requires Hugo Extended for proper functionality
- Check version: `hugo version`

**Build errors?**
- Check for syntax errors in YAML front matter (common cause)
- Verify all required front matter fields are present
- Ensure proper markdown formatting

**Local development server issues?**
```bash
# If server is not accessible, try binding to all interfaces
hugo server --bind 0.0.0.0 --baseURL http://localhost:1313

# Clear Hugo cache if needed
hugo --cleanDestinationDir
```

### Deployment Issues

**Site redirects to inaccessible domain?**
If the site redirects to a non-working custom domain:
1. Go to your repository's **Settings** → **Pages**
2. Under "Custom domain", remove any custom domain if it's not working  
3. Ensure "Source" is set to "Deploy from a branch" with branch `gh-pages`
4. Wait a few minutes for DNS changes to take effect

**GitHub Actions deployment fails?**
- Check the Actions tab for build logs
- Ensure all required environment variables are set
- Verify the deploy workflow has proper permissions