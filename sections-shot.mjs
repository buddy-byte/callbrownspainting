import puppeteer from 'puppeteer';
const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2', timeout: 30000 });
await new Promise(r => setTimeout(r, 2000));
const height = await page.evaluate(() => document.body.scrollHeight);
// Services dark section
await page.screenshot({ path: 'temporary screenshots/screenshot-5-services.png', clip: { x: 0, y: 2100, width: 1440, height: 900 } });
// CTA + footer
await page.screenshot({ path: 'temporary screenshots/screenshot-6-cta-footer.png', clip: { x: 0, y: height - 1000, width: 1440, height: 1000 } });
console.log('total height:', height);
await browser.close();
