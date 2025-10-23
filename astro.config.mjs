import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import vercel from '@astrojs/vercel/serverless';

// https://astro.build/config
export default defineConfig({
  site: 'https://callbrownspainting.com',
  output: 'hybrid',
  adapter: vercel({
    webAnalytics: {
      enabled: true
    },
    functionPerRoute: false,
    imageService: true,
    imagesConfig: {
      sizes: [640, 750, 828, 1080, 1200, 1920, 2048, 3840],
      domains: []
    }
  }),
  integrations: [
    sitemap()
  ],
  compressHTML: true,
  build: {
    inlineStylesheets: 'auto'
  }
});

