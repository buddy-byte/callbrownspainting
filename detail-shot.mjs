import puppeteer from 'puppeteer';
const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2', timeout: 30000 });
await new Promise(r => setTimeout(r, 2000));
// Gallery cards
await page.screenshot({ path: 'temporary screenshots/screenshot-10-gallery.png', clip: { x: 0, y: 3100, width: 1440, height: 900 } });
// Testimonials
await page.screenshot({ path: 'temporary screenshots/screenshot-11-testimonials.png', clip: { x: 0, y: 6700, width: 1440, height: 900 } });
console.log('Done');
await browser.close();
