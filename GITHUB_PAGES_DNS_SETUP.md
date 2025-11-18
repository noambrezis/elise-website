# GitHub Pages + GoDaddy DNS Configuration Guide

This guide will help you configure your GoDaddy DNS to work with GitHub Pages for your custom domain.

## Prerequisites
- Your website code is pushed to a GitHub repository
- GitHub Pages is enabled for your repository
- You have access to your GoDaddy account

## Step 1: Enable GitHub Pages

1. Go to your GitHub repository
2. Click **Settings** → **Pages**
3. Under **Source**, select your branch (usually `main` or `master`)
4. Under **Custom domain**, enter your domain: `elisebrezis.com` (apex domain)
5. Check **Enforce HTTPS** (recommended)
6. GitHub will create a `CNAME` file automatically, or you can create it manually in the root of your repository with the content: `elisebrezis.com`

**Note**: Using the apex domain (`elisebrezis.com`) in the CNAME file allows both `elisebrezis.com` and `www.elisebrezis.com` to work when DNS is configured correctly.

## Step 2: Configure GoDaddy DNS Records

### Recommended: Set up BOTH apex and www domains

To make both `elisebrezis.com` and `www.elisebrezis.com` work:

1. Log in to your GoDaddy account
2. Go to **My Products** → **Domains** → Click **DNS** next to your domain
3. **For the apex domain** (`elisebrezis.com`):
   - Delete any existing A records for the root domain (@)
   - Add the following **A records** (you need all 4):
     - **Type**: A
     - **Name**: @ (or leave blank for root domain)
     - **Value**: `185.199.108.153`
     - **TTL**: 600 seconds (or default)
     
     Repeat for these IPs:
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`

4. **For the www subdomain** (`www.elisebrezis.com`):
   - Add a **CNAME record**:
     - **Type**: CNAME
     - **Name**: www
     - **Value**: `yourusername.github.io` (replace with your GitHub username)
     - **TTL**: 600 seconds

This configuration will make both domains work:
- ✅ `elisebrezis.com` (via A records)
- ✅ `www.elisebrezis.com` (via CNAME record)

**Note**: GitHub Pages IP addresses may change. Check the latest IPs at: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain

## Step 3: Wait for DNS Propagation

- DNS changes can take 24-48 hours to propagate globally
- You can check propagation status using tools like:
  - https://www.whatsmydns.net/
  - https://dnschecker.org/

## Step 4: Verify Configuration

1. After DNS propagates, go back to GitHub repository **Settings** → **Pages**
2. You should see a green checkmark indicating your domain is verified
3. Visit your domain in a browser to confirm it's working

## Troubleshooting

### Domain not verifying
- Wait longer for DNS propagation (can take up to 48 hours)
- Double-check DNS records are correct
- Make sure the CNAME file in your repository matches your domain exactly

### Site not loading
- Clear your browser cache
- Try accessing from an incognito/private window
- Check if GitHub Pages shows any errors in the repository settings

### HTTPS not working
- Make sure "Enforce HTTPS" is checked in GitHub Pages settings
- Wait for DNS to fully propagate
- GitHub will automatically provision SSL certificates once DNS is verified

## Current GitHub Pages IP Addresses (as of 2024)

If the IPs above don't work, check GitHub's documentation for the latest IP addresses:
https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain

## Important Notes

- **A Records**: Use for apex domain (elisebrezis.com) - required because CNAME cannot be used for root domain
- **CNAME Records**: Use for subdomains (www.elisebrezis.com)
- The CNAME file in your repository should contain the apex domain (`elisebrezis.com`) - this allows both apex and www to work
- GitHub Pages will automatically redirect between www and non-www versions when both are configured
- GitHub Pages is free for public repositories
- Both `elisebrezis.com` and `www.elisebrezis.com` will work once DNS is properly configured

