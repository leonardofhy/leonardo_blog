# Leonardo's Blog

A personal blog built with [Pelican](https://getpelican.com/), deployed automatically to GitHub Pages.

## 🌐 Live Site: [https://leonardofhy.github.io/leonardo_blog](https://leonardofhy.github.io/leonardo_blog)

**👆 Click the link above to access the blog!** The site is automatically deployed and available online - no local setup required to read the content.

## 📝 How to Add New Blog Posts

To add a new blog post to this repository:

### Step 1: Create a New Post File
1. Navigate to the `content/` folder in this repository
2. Create a new `.md` (Markdown) file with a descriptive name like `my-new-post.md`

### Step 2: Add Post Metadata
Start your file with metadata in this format:

```markdown
Title: Your Post Title Here
Date: 2025-01-15 10:30
Category: General
Tags: ai, technology, notes
Slug: your-post-url-slug
Author: Leonardo Foo
Summary: A brief summary of what this post is about.

## Your Content Starts Here

Write your blog post content using Markdown...
```

### Step 3: Write Your Content
- Use standard Markdown syntax
- Add headers with `##`, `###`
- Create lists with `-` or `1.`
- Add links: `[text](URL)`
- Include code blocks with triple backticks
- For images: place them in `content/images/` and reference as `![alt text]({static}/images/filename.jpg)`

### Step 4: Commit and Push
1. Commit your new file to the repository
2. Push to the `main` branch
3. GitHub Actions will automatically build and deploy your post
4. Your post will be live on the website within 2-3 minutes!

## Table of Contents

- [About](#about)
- [Adding Images](#adding-images)
- [Quick Local Testing (Optional)](#quick-local-testing-optional)
- [Known Issues](#known-issues)
- [Project Structure](#project-structure)

## About

This is Leonardo Foo's personal blog where he shares notes and thoughts about AI and other technical topics. The blog is built using:

- **Pelican**: Python-based static site generator
- **Flex Theme**: Modern, responsive theme  
- **GitHub Pages**: Free hosting with automatic deployment
- **GitHub Actions**: Automated build process

## Adding Images

To include images in your blog posts:

1. **Upload images**: Place image files in the `content/images/` folder
2. **Reference in posts**: Use this format in your Markdown:
   ```markdown
   ![Image description]({static}/images/your-image.jpg)
   ```

## Quick Local Testing (Optional)

If you want to test your posts locally before publishing:

### Prerequisites
- Python 3.9+
- Git

### Setup
1. **Clone the repository**:
   ```bash
   git clone --recursive https://github.com/leonardofhy/leonardo_blog.git
   cd leonardo_blog
   ```

2. **Install Poetry** (if needed):
   ```bash
   pip install poetry
   ```

3. **Install dependencies**:
   ```bash
   poetry install --no-root
   ```

4. **Build and serve**:
   ```bash
   poetry run pelican ./content -s pelicanconf.py -o ./output
   cd output && python -m http.server 8000
   ```
   
   Visit [http://localhost:8000](http://localhost:8000) to preview your site.

**Note**: Local testing is completely optional since the site is automatically deployed when you push to GitHub.

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

## Known Issues

### Theme Submodule Initialization
If you encounter a "Could not find the theme" error when building locally:

```bash
# Run this command to initialize themes:
git submodule update --init --recursive
```

This issue occurs because the Pelican themes are included as a git submodule. The GitHub Actions deployment handles this automatically, but local development requires manual initialization.

### Adding New Themes
To use a different theme:
1. Browse available themes in the `pelican-themes/` directory
2. Update the `THEME` setting in `pelicanconf.py`
3. Test locally before pushing to ensure the theme works correctly