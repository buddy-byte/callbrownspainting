import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });

const pages = [
  { url: 'http://localhost:4326/services', name: 'services' },
  { url: 'http://localhost:4326/about', name: 'about' },
  { url: 'http://localhost:4326/contact', name: 'contact' },
  { url: 'http://localhost:4326/interior-painting', name: 'interior' },
  { url: 'http://localhost:4326/exterior-painting', name: 'exterior' },
];

for (const p of pages) {
  await page.goto(p.url, { waitUntil: 'networkidle2', timeout: 15000 });
  await new Promise(r => setTimeout(r, 800));
  await page.screenshot({ path: `temporary screenshots/inner-${p.name}.png`, fullPage: false });
  console.log(`✓ ${p.name}`);
}

await browser.close();
