# 🚀 Vercel Deployment Guide

## Quick Deploy (Recommended)

### Option 1: Deploy via Vercel Dashboard

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: SEO-optimized Astro website"
   git branch -M main
   git remote add origin https://github.com/yourusername/your-repo.git
   git push -u origin main
   ```

2. **Import to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Click "Add New Project"
   - Import your GitHub repository
   - Vercel will auto-detect Astro settings
   - Click "Deploy"

3. **Done!** Your site will be live in ~2 minutes

### Option 2: Deploy via Vercel CLI

1. **Install Vercel CLI**
   ```bash
   npm i -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy**
   ```bash
   vercel
   ```
   
   Follow the prompts:
   - Set up and deploy? **Y**
   - Which scope? Select your account
   - Link to existing project? **N**
   - Project name? (press enter for default)
   - Directory? **./astro-seo-website**
   - Override settings? **N**

4. **Production Deploy**
   ```bash
   vercel --prod
   ```

## Configuration

### Environment Variables

If you need environment variables (API keys, etc.):

1. **In Vercel Dashboard:**
   - Go to Project Settings
   - Navigate to "Environment Variables"
   - Add your variables

2. **Via CLI:**
   ```bash
   vercel env add VARIABLE_NAME
   ```

### Custom Domain

1. **In Vercel Dashboard:**
   - Go to Project Settings
   - Click "Domains"
   - Add your custom domain
   - Follow DNS configuration instructions

2. **Update Site URL:**
   - Update `site` in `astro.config.mjs`
   - Update domain in `public/robots.txt`
   - Update domain in `src/layouts/BaseLayout.astro`

## Post-Deployment Checklist

### Immediate Tasks (Day 1)

- [ ] Verify site is live and accessible
- [ ] Test all pages load correctly
- [ ] Check mobile responsiveness
- [ ] Test contact form (if applicable)
- [ ] Verify SSL certificate is active (https://)

### SEO Setup (Week 1)

- [ ] **Google Search Console**
  1. Go to [search.google.com/search-console](https://search.google.com/search-console)
  2. Add your property (domain or URL prefix)
  3. Verify ownership (use HTML tag method)
  4. Submit sitemap: `https://your-domain.com/sitemap-index.xml`

- [ ] **Google Analytics**
  1. Create GA4 property
  2. Get tracking ID
  3. Add to your site (see instructions below)

- [ ] **Bing Webmaster Tools**
  1. Go to [bing.com/webmasters](https://www.bing.com/webmasters)
  2. Add and verify your site
  3. Submit sitemap

### Adding Google Analytics

Create `src/components/Analytics.astro`:

```astro
---
const GA_MEASUREMENT_ID = 'G-XXXXXXXXXX'; // Replace with your ID
---

<!-- Google tag (gtag.js) -->
<script async src={`https://www.googletagmanager.com/gtag/js?id=${GA_MEASUREMENT_ID}`}></script>
<script define:vars={{ GA_MEASUREMENT_ID }}>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', GA_MEASUREMENT_ID);
</script>
```

Then add to `BaseLayout.astro`:
```astro
---
import Analytics from '../components/Analytics.astro';
---

<head>
  <!-- ... existing head content ... -->
  <Analytics />
</head>
```

## Performance Monitoring

### Vercel Analytics

Already configured! Check:
- Vercel Dashboard → Your Project → Analytics
- View real user metrics
- Core Web Vitals
- Page load times

### Tools to Test Performance

1. **PageSpeed Insights**
   - [pagespeed.web.dev](https://pagespeed.web.dev)
   - Test both mobile and desktop
   - Aim for 90+ score

2. **GTmetrix**
   - [gtmetrix.com](https://gtmetrix.com)
   - Detailed performance analysis

3. **WebPageTest**
   - [webpagetest.org](https://www.webpagetest.org)
   - Advanced testing options

## Continuous Deployment

### Automatic Deployments

Every time you push to your main branch:
1. Vercel automatically builds your site
2. Runs tests (if configured)
3. Deploys to production
4. Updates live site

### Preview Deployments

- Every pull request gets a unique preview URL
- Test changes before merging
- Share with team/clients for feedback

## Troubleshooting

### Build Fails

1. Check build logs in Vercel dashboard
2. Test build locally: `npm run build`
3. Ensure all dependencies are in `package.json`
4. Check Node.js version compatibility

### 404 Errors

1. Verify file paths are correct
2. Check `astro.config.mjs` settings
3. Ensure pages are in `src/pages/`

### Slow Performance

1. Optimize images (use WebP, compress)
2. Check bundle size
3. Review third-party scripts
4. Enable caching headers (already configured)

## Updating Your Site

### Making Changes

1. **Edit locally**
   ```bash
   npm run dev
   ```

2. **Test changes** at `localhost:4321`

3. **Commit and push**
   ```bash
   git add .
   git commit -m "Description of changes"
   git push
   ```

4. **Vercel auto-deploys** (1-2 minutes)

### Rollback if Needed

In Vercel Dashboard:
- Go to Deployments
- Find previous working deployment
- Click "..." → "Promote to Production"

## Cost & Limits

### Vercel Free Tier Includes:

- ✅ Unlimited deployments
- ✅ 100 GB bandwidth/month
- ✅ Automatic HTTPS
- ✅ Preview deployments
- ✅ Analytics (basic)
- ✅ Custom domains

### When to Upgrade:

- More bandwidth needed
- Team collaboration features
- Advanced analytics
- Priority support

## Next Steps

1. **Content**: Replace placeholder text with your actual content
2. **Design**: Customize colors, fonts, and styling
3. **SEO**: Follow the SEO-GUIDE.md for keyword research
4. **Marketing**: Share your site, build backlinks
5. **Monitor**: Track analytics and rankings
6. **Iterate**: Continuously improve based on data

## Support Resources

- **Astro Docs**: [docs.astro.build](https://docs.astro.build)
- **Vercel Docs**: [vercel.com/docs](https://vercel.com/docs)
- **Vercel Support**: [vercel.com/support](https://vercel.com/support)
- **Community**: Astro Discord, Vercel Discord

---

🎉 **Congratulations!** Your SEO-optimized website is ready to deploy!

