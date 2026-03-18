import puppeteer from 'puppeteer';
import path from 'path';

const OUT = 'brand_assets/reference';

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });

console.log('Loading wisecoatings.com...');
await page.goto('https://wisecoatings.com/', { waitUntil: 'networkidle2', timeout: 45000 });
await new Promise(r => setTimeout(r, 3000));

// Full page
await page.screenshot({ path: `${OUT}/wise-v2-full.png`, fullPage: true });
console.log('✓ full page');

// Individual viewport slices (each 900px tall)
const totalHeight = await page.evaluate(() => document.body.scrollHeight);
console.log(`Total height: ${totalHeight}px`);

const slices = Math.ceil(totalHeight / 900);
for (let i = 0; i < slices; i++) {
  await page.evaluate((scroll) => window.scrollTo(0, scroll), i * 800);
  await new Promise(r => setTimeout(r, 600));
  await page.screenshot({ path: `${OUT}/wise-slice-${String(i+1).padStart(2,'0')}.png`, fullPage: false });
  console.log(`✓ slice ${i+1}/${slices}`);
}

await browser.close();
console.log('Done.');
