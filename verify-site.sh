#!/bin/bash
# GitHub Pages Site Accessibility Check Script
# This script helps verify that all necessary components are in place for the blog to be accessible

echo "=== GitHub Pages Blog Accessibility Verification ==="
echo

# Check if Hugo site builds successfully
echo "1. Testing Hugo build..."
if hugo --minify; then
    echo "✅ Hugo site builds successfully"
else
    echo "❌ Hugo build failed"
    exit 1
fi

# Check if CNAME file exists and has correct content
echo
echo "2. Checking CNAME configuration..."
if [ -f "static/CNAME" ]; then
    cname_content=$(cat static/CNAME)
    if [ "$cname_content" = "leonardofhy.blog" ]; then
        echo "✅ CNAME file exists with correct domain: $cname_content"
    else
        echo "❌ CNAME file has incorrect content: $cname_content"
    fi
else
    echo "❌ CNAME file not found in static directory"
fi

# Check if deployment workflow exists
echo
echo "3. Checking GitHub Actions deployment workflow..."
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ Deployment workflow exists"
    if grep -q "cname: leonardofhy.blog" .github/workflows/deploy.yml; then
        echo "✅ Workflow configured with correct custom domain"
    else
        echo "⚠️ Custom domain not found in workflow configuration"
    fi
else
    echo "❌ Deployment workflow not found"
fi

# Check Hugo configuration
echo
echo "4. Checking Hugo configuration..."
if [ -f "hugo.toml" ]; then
    echo "✅ Hugo configuration exists"
    if grep -q "baseURL = 'https://leonardofhy.blog'" hugo.toml; then
        echo "✅ BaseURL correctly set to custom domain"
    else
        echo "❌ BaseURL not set to custom domain"
    fi
else
    echo "❌ Hugo configuration file not found"
fi

# Check content exists
echo
echo "5. Checking content..."
content_count=$(find content -name "*.md" | wc -l)
if [ "$content_count" -gt 0 ]; then
    echo "✅ Found $content_count content file(s)"
else
    echo "⚠️ No content files found"
fi

# Check theme
echo
echo "6. Checking theme..."
if [ -d "themes/PaperMod" ]; then
    echo "✅ PaperMod theme directory exists"
    if [ -f "themes/PaperMod/theme.toml" ]; then
        echo "✅ Theme appears to be properly installed"
    else
        echo "⚠️ Theme may not be fully installed"
    fi
else
    echo "❌ PaperMod theme directory not found"
fi

echo
echo "=== Verification Complete ==="
echo "If all checks pass, the site should be accessible after deployment."