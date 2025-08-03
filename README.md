# Leonardo's Blog

A personal blog built with [Pelican](https://getpelican.com/), a Python-based static site generator, and deployed to GitHub Pages.

🌐 **Live Site**: [https://leonardofhy.github.io/leonardo_blog](https://leonardofhy.github.io/leonardo_blog)

## Table of Contents

- [About](#about)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Local Development](#local-development)
- [Creating Blog Posts](#creating-blog-posts)
- [Building and Deployment](#building-and-deployment)
- [Customization](#customization)
- [Project Structure](#project-structure)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## About

This is Leonardo Foo's personal blog where he shares notes and thoughts about AI and other technical topics. The blog is built using:

- **Pelican**: Python-based static site generator
- **Flex Theme**: Modern, responsive theme
- **GitHub Pages**: Free hosting
- **GitHub Actions**: Automated deployment
- **Poetry**: Python dependency management

## Prerequisites

Before you can run this blog locally, make sure you have:

- **Python 3.9+** installed on your system
- **Poetry** for dependency management
- **Git** for version control

### Installing Poetry

If you don't have Poetry installed:

```bash
# On macOS/Linux
curl -sSL https://install.python-poetry.org | python3 -

# On Windows (PowerShell)
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -

# Alternative: using pip
pip install poetry
```

## Quick Start

1. **Clone the repository** (including themes):
   ```bash
   git clone --recursive https://github.com/leonardofhy/leonardo_blog.git
   cd leonardo_blog
   ```

2. **Install dependencies**:
   ```bash
   poetry install --no-root
   ```

3. **Build the site**:
   ```bash
   poetry run pelican ./content -s pelicanconf.py -o ./output
   ```

4. **Serve locally** (optional):
   ```bash
   poetry run make devserver
   ```
   
   Visit [http://localhost:8000](http://localhost:8000) to view your site.

## Local Development

### Setting Up Development Environment

1. **Clone with submodules** (themes):
   ```bash
   git clone --recursive https://github.com/leonardofhy/leonardo_blog.git
   cd leonardo_blog
   ```

   If you already cloned without `--recursive`, initialize submodules:
   ```bash
   git submodule update --init --recursive
   ```

2. **Install dependencies**:
   ```bash
   poetry install --no-root
   ```

### Development Workflow

1. **Start development server**:
   ```bash
   poetry run make devserver
   ```
   This will:
   - Build the site automatically when files change
   - Serve the site at [http://localhost:8000](http://localhost:8000)
   - Reload the browser when content changes

2. **Alternative development commands**:
   ```bash
   # Build only (no server)
   poetry run pelican ./content -s pelicanconf.py -o ./output
   
   # Build for production
   poetry run pelican ./content -s publishconf.py -o ./output
   
   # Clean output directory
   rm -rf ./output
   ```

### Using Make Commands

The repository includes a Makefile for convenience. Since we use Poetry, prefix commands with `poetry run`:

```bash
# Generate the site
poetry run make html

# Serve locally (with auto-reload)
poetry run make devserver

# Clean generated files
make clean

# Build for production
poetry run make publish

# Deploy to GitHub Pages (manual)
poetry run make github
```

## Creating Blog Posts

### Basic Post Structure

Create a new Markdown file in the `content/` directory:

```markdown
Title: Your Post Title
Date: 2025-01-15 10:30
Category: General
Tags: pelican, python, blog
Slug: your-post-slug
Author: Leonardo Foo
Summary: A brief summary of your post content.

## Your Post Content

Write your blog post content here using Markdown syntax.

### Subheadings

- Lists
- **Bold text**
- *Italic text*
- [Links](https://example.com)
- Code blocks
```

### Metadata Fields

- **Title**: The post title
- **Date**: Publication date (YYYY-MM-DD HH:MM format)
- **Category**: Post category (creates category pages)
- **Tags**: Comma-separated tags (creates tag pages)
- **Slug**: URL-friendly version of the title
- **Author**: Author name
- **Summary**: Brief description for post listings

### Organizing Content

- Put all posts in the `content/` directory
- Use subdirectories to organize by topic if desired
- Images can be placed in `content/images/` and referenced as `{static}/images/filename.jpg`

## Building and Deployment

### Automatic Deployment (Recommended)

The blog is configured for automatic deployment via GitHub Actions:

1. **Push to main branch**:
   ```bash
   git add .
   git commit -m "Add new blog post"
   git push origin main
   ```

2. **GitHub Actions will**:
   - Install dependencies
   - Build the site using `publishconf.py`
   - Deploy to GitHub Pages
   - Site becomes available at the configured URL

### Manual Deployment

If you need to deploy manually:

1. **Build for production**:
   ```bash
   poetry run pelican ./content -s publishconf.py -o ./output
   ```

2. **Deploy to GitHub Pages**:
   ```bash
   # Install ghp-import if not available
   pip install ghp-import
   
   # Deploy
   ghp-import -m "Deploy blog" -b gh-pages ./output --no-jekyll
   git push origin gh-pages
   ```

## Customization

### Site Configuration

Edit `pelicanconf.py` to customize:

- **SITENAME**: Your site title
- **SITEURL**: Your site URL
- **AUTHOR**: Your name
- **TIMEZONE**: Your timezone
- **DEFAULT_LANG**: Default language

### Theme Customization

The blog uses the Flex theme. To customize:

1. **Theme settings** in `pelicanconf.py`:
   ```python
   THEME = 'pelican-themes/Flex'
   
   # Flex theme specific settings
   SITELOGO = '/images/logo.png'
   SITETITLE = 'Leonardo\'s Notes'
   SITEDESCRIPTION = 'AI and Technology Notes'
   ```

2. **Change theme**: Browse available themes in `pelican-themes/` and update the `THEME` setting.

### Adding Custom CSS/JS

1. Create `content/extra/` directory
2. Add your custom files
3. Configure in `pelicanconf.py`:
   ```python
   STATIC_PATHS = ['images', 'extra']
   EXTRA_PATH_METADATA = {
       'extra/custom.css': {'path': 'css/custom.css'},
   }
   ```

## Project Structure

```
leonardo_blog/
├── content/                 # Blog posts and pages
│   ├── hello-world.md      # Example blog post
│   └── images/             # Static images
├── pelican-themes/         # Theme submodule
│   └── Flex/              # Current theme
├── output/                 # Generated site (git-ignored)
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions deployment
├── pelicanconf.py          # Development configuration
├── publishconf.py          # Production configuration
├── pyproject.toml          # Poetry dependencies
├── poetry.lock             # Locked dependencies
├── Makefile                # Build commands
└── README.md               # This file
```

## Troubleshooting

### Common Issues

1. **Theme not found error**:
   ```bash
   git submodule update --init --recursive
   ```

2. **Poetry installation issues**:
   ```bash
   poetry install --no-root
   ```

3. **Build fails**:
   - Check that Python 3.9+ is installed
   - Ensure Poetry dependencies are installed
   - Verify content metadata is correct

4. **Images not showing**:
   - Use `{static}/images/filename.jpg` in Markdown
   - Ensure images are in `content/images/`

### Getting Help

- Check the [Pelican documentation](https://docs.getpelican.com/)
- Review [Flex theme documentation](https://github.com/alexandrevicenzi/Flex)
- Look at existing posts in `content/` for examples

## Contributing

If you'd like to contribute to this blog:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally
5. Submit a pull request

### Development Guidelines

- Follow existing post metadata format
- Test builds locally before pushing
- Keep commits focused and descriptive
- Update documentation if needed

---

**Note**: This blog is automatically deployed to GitHub Pages. Changes pushed to the `main` branch will be live within a few minutes.