import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });

await page.goto('http://localhost:4326/', { waitUntil: 'networkidle2', timeout: 20000 });
await new Promise(r => setTimeout(r, 2000));

// Full page
await page.screenshot({ path: 'temporary screenshots/new-full.png', fullPage: true });
console.log('✓ full page');

// Section slices
const totalH = await page.evaluate(() => document.body.scrollHeight);
const sliceH = 900;
const slices = Math.ceil(totalH / sliceH);
for (let i = 0; i < slices; i++) {
  await page.evaluate(y => window.scrollTo(0, y), i * sliceH);
  await new Promise(r => setTimeout(r, 400));
  await page.screenshot({ path: `temporary screenshots/new-slice-${String(i+1).padStart(2,'0')}.png` });
  console.log(`✓ slice ${i+1}/${slices}`);
}

await browser.close();
