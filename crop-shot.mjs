import puppeteer from 'puppeteer';
const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2', timeout: 30000 });
await new Promise(r => setTimeout(r, 2000));
// Hero crop
await page.screenshot({ path: 'temporary screenshots/screenshot-3-hero.png', clip: { x: 0, y: 0, width: 1440, height: 900 } });
// Stats + about crop
await page.screenshot({ path: 'temporary screenshots/screenshot-4-sections.png', clip: { x: 0, y: 900, width: 1440, height: 1200 } });
console.log('Done');
await browser.close();
