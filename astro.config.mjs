import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import vercel from '@astrojs/vercel/serverless';

// https://astro.build/config
export default defineConfig({
  site: 'https://callbrownspainting.com',
  output: 'hybrid', // Enable API routes while keeping pages static
  adapter: vercel(),
  integrations: [
    sitemap()
  ],
  compressHTML: true,
  build: {
    inlineStylesheets: 'auto'
  }
});

