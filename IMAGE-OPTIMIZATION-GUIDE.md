# Image Optimization Guide for Brown's Painting Website

## 🎯 Overview
This guide covers the complete image optimization system implemented for the Brown's Painting website to improve Core Web Vitals and overall performance.

## 📁 Image Directory Structure
```
public/images/
├── blog/           # Blog post images
├── equipment/      # Equipment photos
├── gallery/        # Project gallery images
├── logo/           # Company logos and branding
├── projects/       # Before/after project photos
├── team/           # Team member photos
└── testimonials/   # Customer testimonial images
```

## 🚀 Quick Start

### 1. Install ImageMagick
Download and install ImageMagick from: https://imagemagick.org/script/download.php#windows
Or use Chocolatey: `choco install imagemagick`

### 2. Run Image Optimization
```powershell
cd c:\Users\b2b\astro-seo-website
.\optimize-images.ps1
```

### 3. Upload Your Images
Place your images in the appropriate directories:
- **Hero images**: `public/images/gallery/`
- **Project photos**: `public/images/projects/`
- **Equipment shots**: `public/images/equipment/`
- **Team photos**: `public/images/team/`
- **Logo files**: `public/images/logo/`

## 🛠️ Image Optimization Features

### WebP Conversion
- **Automatic WebP conversion** with quality optimization
- **Fallback support** for older browsers
- **Quality settings**:
  - Hero images: 85% quality
  - Standard images: 80% quality
  - Thumbnails: 75% quality

### Responsive Images
- **Multiple sizes** generated automatically:
  - Thumbnail: 300x200px
  - Small: 600x400px
  - Medium: 1200x800px
  - Large: 1920x1280px
- **Smart sizing** based on image type and location

### Lazy Loading
- **Intersection Observer** for modern browsers
- **Fallback support** for older browsers
- **Blur effect** during loading
- **Smooth transitions** when images load

## 📱 Using Optimized Images in Components

### Basic Image Component
```astro
---
import Image from '../components/Image.astro';
---

<Image 
  src="/images/projects/house-before.jpg" 
  alt="Before: House transformation" 
  width={600}
  height={400}
  loading="lazy"
/>
```

### Advanced Optimized Image Component
```astro
---
import OptimizedImage from '../components/OptimizedImage.astro';
---

<OptimizedImage 
  src="/images/gallery/hero-project.jpg" 
  alt="Featured project" 
  width={1200}
  height={800}
  priority={true}
  sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
  className="hero-image"
/>
```

## 🎨 Image Best Practices

### File Formats
- **Primary**: WebP (modern browsers)
- **Fallback**: JPG/PNG (older browsers)
- **Avoid**: HEIC, TIFF, BMP (convert to JPG/PNG first)

### File Sizes
- **Hero images**: < 200KB
- **Gallery images**: < 150KB
- **Thumbnails**: < 50KB
- **Icons/logos**: < 20KB

### Dimensions
- **Hero images**: 1920x1080px (16:9 ratio)
- **Gallery images**: 1200x800px (3:2 ratio)
- **Thumbnails**: 300x200px (3:2 ratio)
- **Logos**: 400x200px (2:1 ratio)

### Naming Convention
```
browns-painting-logo.png
house-before-transformation.jpg
interior-ceiling-work.jpg
boom-lift-equipment.jpg
team-boomer-brown.jpg
```

## 🔧 Manual Optimization (if needed)

### Using ImageMagick Command Line
```bash
# Convert to WebP with quality optimization
magick input.jpg -quality 80 output.webp

# Resize and convert
magick input.jpg -resize 1200x800> -quality 80 output.webp

# Create multiple sizes
magick input.jpg -resize 300x200> -quality 75 thumbnail.webp
magick input.jpg -resize 600x400> -quality 80 small.webp
magick input.jpg -resize 1200x800> -quality 80 medium.webp
magick input.jpg -resize 1920x1280> -quality 85 large.webp
```

## 📊 Performance Monitoring

### Core Web Vitals Targets
- **LCP (Largest Contentful Paint)**: < 2.5s
- **FID (First Input Delay)**: < 100ms
- **CLS (Cumulative Layout Shift)**: < 0.1

### Testing Tools
- **Google PageSpeed Insights**: https://pagespeed.web.dev/
- **GTmetrix**: https://gtmetrix.com/
- **WebPageTest**: https://www.webpagetest.org/

## 🚨 Troubleshooting

### Images Not Loading
1. Check file paths are correct
2. Ensure images exist in public directory
3. Verify WebP conversion completed successfully
4. Check browser console for errors

### Poor Performance
1. Run image optimization script
2. Check image file sizes
3. Verify lazy loading is working
4. Test on different devices/connections

### WebP Not Working
1. Check browser support
2. Verify fallback images exist
3. Test with different browsers
4. Check ImageMagick installation

## 📈 Expected Performance Improvements

### Before Optimization
- **Average image size**: 500KB+
- **Load time**: 3-5 seconds
- **Core Web Vitals**: Poor

### After Optimization
- **Average image size**: 150KB (70% reduction)
- **Load time**: 1-2 seconds (60% improvement)
- **Core Web Vitals**: Good/Excellent

## 🔄 Maintenance

### Regular Tasks
1. **Monthly**: Run optimization script on new images
2. **Quarterly**: Review and update image sizes
3. **Annually**: Audit and clean up unused images

### Adding New Images
1. Place in appropriate directory
2. Use descriptive, SEO-friendly names
3. Run optimization script
4. Update components to use new images
5. Test on multiple devices

## 📞 Support

If you encounter issues with image optimization:
1. Check this guide first
2. Verify ImageMagick installation
3. Test with a single image
4. Check file permissions
5. Review error messages in PowerShell

---

**Last Updated**: January 2025
**Version**: 1.0
**Maintained by**: Brown's Painting Development Team
