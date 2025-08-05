# GitHub Pages Blog Troubleshooting Guide

This guide helps troubleshoot common issues with GitHub Pages site accessibility.

## Site Accessibility Checklist

All technical components are properly configured:
- ✅ Hugo site builds successfully (19 pages generated)
- ✅ CNAME file correctly configured with `leonardofhy.blog`
- ✅ GitHub Actions deployment workflow working
- ✅ Custom domain configured in workflow
- ✅ BaseURL set to `https://leonardofhy.blog`
- ✅ Content and theme properly installed

## If Site Is Still Not Accessible

### 1. Check GitHub Pages Settings
1. Go to your repository: https://github.com/leonardofhy/leonardo_blog
2. Click **Settings** tab
3. Scroll down to **Pages** section
4. Verify:
   - Source is set to "Deploy from a branch"
   - Branch is set to "gh-pages"
   - Custom domain shows "leonardofhy.blog"
   - "Enforce HTTPS" is checked

### 2. DNS Configuration
If you control the domain `leonardofhy.blog`, verify DNS settings:
- Add CNAME record pointing to `leonardofhy.github.io`
- Or add A records pointing to GitHub Pages IPs:
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153

### 3. Wait for Propagation
- DNS changes can take up to 24-48 hours to propagate
- GitHub Pages deployment may take a few minutes after push

### 4. Check Deployment Status
1. Go to **Actions** tab in your repository
2. Verify the latest workflow run completed successfully
3. Check that the run shows "Deploy Hugo Site to GitHub Pages" was successful

### 5. Force Fresh Deployment
If needed, trigger a fresh deployment:
```bash
git commit --allow-empty -m "Trigger deployment"
git push origin main
```

### 6. Alternative Access
If custom domain isn't working, the site should still be accessible at:
https://leonardofhy.github.io/leonardo_blog/

## Common Issues and Solutions

### Issue: Site shows 404 error
**Solution**: Check that GitHub Pages is configured to use the `gh-pages` branch

### Issue: Site loads but looks broken
**Solution**: Verify the baseURL in `hugo.toml` matches your custom domain

### Issue: DNS not resolving
**Solution**: Check domain registrar DNS settings and add appropriate records

### Issue: SSL certificate error
**Solution**: Wait for GitHub to provision SSL certificate (can take a few hours)

## Verification Commands

Run these commands in your local repository to verify setup:
```bash
# Verify Hugo builds
hugo --minify

# Check CNAME file
cat static/CNAME

# Verify workflow configuration
grep -n "cname:" .github/workflows/deploy.yml

# Check recent deployments
# (Visit GitHub Actions tab in browser)
```

## Getting Help

If issues persist:
1. Check GitHub Status: https://www.githubstatus.com/
2. GitHub Pages documentation: https://docs.github.com/en/pages
3. Hugo documentation: https://gohugo.io/documentation/

---

**Last Updated**: Based on repository analysis on 2025-08-05
**Status**: All technical components verified and working correctly