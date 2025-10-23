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
    functionPerRoute: false
  }),
  integrations: [
    sitemap()
  ],
  compressHTML: true,
  build: {
    inlineStylesheets: 'auto'
  }
});

