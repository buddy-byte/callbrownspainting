# 🎨 Customization Guide

## Quick Start Customization

### 1. Update Brand Information

#### `src/components/SEO.astro`
```astro
// Line 17: Update brand name
const fullTitle = `${title} | Your Brand Name`; // Change "Your Brand Name"

// Line 30: Update author
author = 'Your Name', // Change to your name/company

// Line 40: Update site name
<meta property="og:site_name" content="Your Brand Name" />

// Line 47: Update Twitter handle
<meta name="twitter:creator" content="@yourtwitterhandle" />
```

#### `src/layouts/BaseLayout.astro`
```astro
// Lines 24-34: Update Schema.org data
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Your Brand Name", // Update this
  "url": "https://your-domain.com", // Update this
  "description": "Your website description" // Update this
}
```

#### `astro.config.mjs`
```javascript
// Line 7: Update your domain
site: 'https://your-domain.com', // Replace with actual domain
```

#### `public/robots.txt`
```
# Line 5: Update sitemap URL
Sitemap: https://your-domain.com/sitemap-index.xml
```

### 2. Customize Colors

Create `src/styles/variables.css`:

```css
:root {
  /* Primary Colors */
  --color-primary: #667eea;
  --color-primary-dark: #5568d3;
  --color-primary-light: #7c8ef5;
  
  /* Secondary Colors */
  --color-secondary: #764ba2;
  --color-secondary-dark: #5f3d85;
  --color-secondary-light: #8d5bb8;
  
  /* Neutral Colors */
  --color-text: #333333;
  --color-text-light: #555555;
  --color-text-lighter: #666666;
  --color-background: #ffffff;
  --color-background-alt: #f8f9fa;
  
  /* Accent Colors */
  --color-success: #10b981;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  --color-info: #3b82f6;
  
  /* Spacing */
  --spacing-xs: 0.5rem;
  --spacing-sm: 1rem;
  --spacing-md: 1.5rem;
  --spacing-lg: 2rem;
  --spacing-xl: 3rem;
  --spacing-2xl: 4rem;
  
  /* Border Radius */
  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-lg: 1rem;
  --radius-xl: 1.5rem;
  
  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 10px 20px rgba(0, 0, 0, 0.15);
  --shadow-xl: 0 20px 40px rgba(0, 0, 0, 0.2);
  
  /* Typography */
  --font-sans: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --font-serif: Georgia, Cambria, 'Times New Roman', Times, serif;
  --font-mono: 'Courier New', Courier, monospace;
}
```

Import in `BaseLayout.astro`:
```astro
<head>
  <!-- ... existing head content ... -->
  <link rel="stylesheet" href="/styles/variables.css" />
</head>
```

Then use variables in your styles:
```css
.hero {
  background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-secondary) 100%);
}
```

### 3. Add Your Logo

1. **Create logo files:**
   - `public/logo.svg` (main logo)
   - `public/favicon.svg` (browser tab icon)
   - `public/apple-touch-icon.png` (180x180px)
   - `public/og-image.jpg` (1200x630px for social media)

2. **Add logo to header:**

Create `src/components/Header.astro`:
```astro
---
---

<header class="site-header">
  <div class="container">
    <a href="/" class="logo">
      <img src="/logo.svg" alt="Your Brand Name" width="150" height="50" />
    </a>
    <nav class="main-nav">
      <a href="/">Home</a>
      <a href="/about">About</a>
      <a href="/services">Services</a>
      <a href="/contact">Contact</a>
    </nav>
  </div>
</header>

<style>
  .site-header {
    padding: 1rem 0;
    background: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
  }

  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .logo img {
    display: block;
  }

  .main-nav {
    display: flex;
    gap: 2rem;
  }

  .main-nav a {
    color: #333;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
  }

  .main-nav a:hover {
    color: #667eea;
  }

  @media (max-width: 768px) {
    .main-nav {
      gap: 1rem;
    }
  }
</style>
```

Add to your layouts:
```astro
---
import Header from '../components/Header.astro';
---

<body>
  <Header />
  <slot />
</body>
```

### 4. Customize Typography

Add Google Fonts in `BaseLayout.astro`:

```astro
<head>
  <!-- ... existing head content ... -->
  
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet" />
</head>
```

Update global styles:
```css
html {
  font-family: 'Inter', system-ui, sans-serif;
}

h1, h2, h3 {
  font-family: 'Playfair Display', serif;
}
```

### 5. Add Footer

Create `src/components/Footer.astro`:

```astro
---
const currentYear = new Date().getFullYear();
---

<footer class="site-footer">
  <div class="container">
    <div class="footer-grid">
      <div class="footer-col">
        <h3>About Us</h3>
        <p>Your company description goes here.</p>
      </div>
      
      <div class="footer-col">
        <h3>Quick Links</h3>
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/about">About</a></li>
          <li><a href="/services">Services</a></li>
          <li><a href="/contact">Contact</a></li>
        </ul>
      </div>
      
      <div class="footer-col">
        <h3>Contact</h3>
        <ul>
          <li>Email: hello@yourcompany.com</li>
          <li>Phone: +1 (234) 567-890</li>
          <li>Address: Your City, State</li>
        </ul>
      </div>
      
      <div class="footer-col">
        <h3>Follow Us</h3>
        <div class="social-links">
          <a href="#" aria-label="Facebook">FB</a>
          <a href="#" aria-label="Twitter">TW</a>
          <a href="#" aria-label="LinkedIn">LI</a>
          <a href="#" aria-label="Instagram">IG</a>
        </div>
      </div>
    </div>
    
    <div class="footer-bottom">
      <p>&copy; {currentYear} Your Brand Name. All rights reserved.</p>
      <div class="footer-links">
        <a href="/privacy">Privacy Policy</a>
        <a href="/terms">Terms of Service</a>
      </div>
    </div>
  </div>
</footer>

<style>
  .site-footer {
    background: #1a1a1a;
    color: white;
    padding: 3rem 0 1rem;
    margin-top: 4rem;
  }

  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
  }

  .footer-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
  }

  .footer-col h3 {
    color: #667eea;
    margin-bottom: 1rem;
    font-size: 1.2rem;
  }

  .footer-col p {
    line-height: 1.6;
    opacity: 0.9;
  }

  .footer-col ul {
    list-style: none;
    padding: 0;
  }

  .footer-col li {
    margin-bottom: 0.5rem;
  }

  .footer-col a {
    color: white;
    text-decoration: none;
    opacity: 0.8;
    transition: opacity 0.3s;
  }

  .footer-col a:hover {
    opacity: 1;
  }

  .social-links {
    display: flex;
    gap: 1rem;
  }

  .social-links a {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    font-weight: 600;
  }

  .footer-bottom {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding-top: 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
  }

  .footer-bottom p {
    margin: 0;
    opacity: 0.7;
  }

  .footer-links {
    display: flex;
    gap: 1.5rem;
  }

  @media (max-width: 768px) {
    .footer-bottom {
      flex-direction: column;
      text-align: center;
    }
  }
</style>
```

Add to `BaseLayout.astro`:
```astro
---
import Footer from '../components/Footer.astro';
---

<body>
  <slot />
  <Footer />
</body>
```

### 6. Create Service Pages

Create `src/pages/services.astro`:

```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';

const services = [
  {
    title: 'Service One',
    description: 'Description of your first service with relevant keywords.',
    icon: '🚀',
    features: ['Feature 1', 'Feature 2', 'Feature 3']
  },
  {
    title: 'Service Two',
    description: 'Description of your second service.',
    icon: '💡',
    features: ['Feature 1', 'Feature 2', 'Feature 3']
  },
  {
    title: 'Service Three',
    description: 'Description of your third service.',
    icon: '⚡',
    features: ['Feature 1', 'Feature 2', 'Feature 3']
  }
];
---

<BaseLayout
  title="Our Services"
  description="Explore our comprehensive range of services designed to help your business grow and succeed online."
  keywords="services, solutions, offerings"
>
  <main>
    <section class="services-hero">
      <div class="container">
        <h1>Our Services</h1>
        <p class="lead">
          Professional solutions tailored to your business needs
        </p>
      </div>
    </section>

    <section class="services-grid">
      <div class="container">
        {services.map(service => (
          <article class="service-card">
            <div class="service-icon">{service.icon}</div>
            <h2>{service.title}</h2>
            <p>{service.description}</p>
            <ul>
              {service.features.map(feature => (
                <li>{feature}</li>
              ))}
            </ul>
            <a href="/contact" class="btn">Get Started</a>
          </article>
        ))}
      </div>
    </section>
  </main>

  <style>
    /* Add your styles here */
  </style>
</BaseLayout>
```

## Advanced Customizations

### Add Blog Functionality

1. Create `src/pages/blog/index.astro` for blog listing
2. Create `src/pages/blog/[slug].astro` for individual posts
3. Use Astro's Content Collections for managing blog posts

### Add Contact Form Backend

Options:
- **Netlify Forms** (if deploying to Netlify)
- **Formspree** (easy integration)
- **Web3Forms** (free, no backend needed)
- **Custom API** (more control)

### Add Search Functionality

- Use **Pagefind** (Astro integration)
- Or **Algolia** for advanced search

### Add Animations

Install AOS (Animate On Scroll):
```bash
npm install aos
```

Use in components:
```astro
<div data-aos="fade-up">Content</div>
```

## Tips

1. **Test locally** before deploying: `npm run dev`
2. **Build test**: `npm run build` to catch errors
3. **Mobile first**: Always test on mobile devices
4. **Performance**: Keep images optimized
5. **Accessibility**: Use semantic HTML and ARIA labels
6. **SEO**: Update meta tags for each page

---

Need help? Check the README.md or SEO-GUIDE.md for more information!


