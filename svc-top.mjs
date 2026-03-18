import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2' });
await new Promise(r => setTimeout(r, 2000));

// Scroll to services section and screenshot viewport
const rect = await page.evaluate(() => {
  const el = document.querySelector('.svc-bar');
  if (!el) return null;
  const r = el.getBoundingClientRect();
  return { top: r.top + window.scrollY, height: r.height };
});
console.log('svc-bar rect:', JSON.stringify(rect));

// Screenshot the svc-bar directly
const el = await page.$('.svc-bar');
if (el) {
  await el.screenshot({ path: 'temporary screenshots/v16-svcbar.png' });
  console.log('saved svc-bar');
}

// Also screenshot the full services section top half
await page.evaluate(() => {
  const el = document.querySelector('.services-section');
  if (el) el.scrollIntoView();
});
await new Promise(r => setTimeout(r, 500));
await page.screenshot({ path: 'temporary screenshots/v16-svc-viewport.png', clip: { x: 0, y: 0, width: 1440, height: 900 } });
console.log('saved viewport at services');

await browser.close();
