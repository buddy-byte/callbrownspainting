import puppeteer from 'puppeteer';

const pages = [
  { url: 'http://localhost:4321/services', name: 'services' },
  { url: 'http://localhost:4321/interior-painting', name: 'interior' },
  { url: 'http://localhost:4321/about', name: 'about' },
  { url: 'http://localhost:4321/contact', name: 'contact' },
  { url: 'http://localhost:4321/service-areas', name: 'service-areas' },
  { url: 'http://localhost:4321/faq', name: 'faq' },
  { url: 'http://localhost:4321/brewton-painting', name: 'brewton-location' },
  { url: 'http://localhost:4321/fairhope-painting', name: 'fairhope-location' },
];

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });

for (const p of pages) {
  try {
    const page = await browser.newPage();
    await page.setViewport({ width: 1440, height: 900 });
    await page.goto(p.url, { waitUntil: 'networkidle2', timeout: 30000 });
    await new Promise(r => setTimeout(r, 1500));
    await page.screenshot({ path: `temporary screenshots/verify-${p.name}.png`, fullPage: false });
    console.log(`✓ ${p.name}`);
    await page.close();
  } catch(e) {
    console.log(`✗ ${p.name}: ${e.message}`);
  }
}

await browser.close();
console.log('Done.');
