import puppeteer from 'puppeteer';
const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2', timeout: 30000 });
await new Promise(r => setTimeout(r, 2000));
// Hero
await page.screenshot({ path: 'temporary screenshots/r-hero.png', clip: { x:0, y:0, width:1440, height:900 } });
// Feature + services
await page.screenshot({ path: 'temporary screenshots/r-feature.png', clip: { x:0, y:900, width:1440, height:1000 } });
// Services
await page.screenshot({ path: 'temporary screenshots/r-services.png', clip: { x:0, y:1800, width:1440, height:900 } });
// Why section
const h = await page.evaluate(() => document.body.scrollHeight);
await page.screenshot({ path: 'temporary screenshots/r-why.png', clip: { x:0, y:3100, width:1440, height:900 } });
// CTA strip + footer
await page.screenshot({ path: 'temporary screenshots/r-cta.png', clip: { x:0, y:h-900, width:1440, height:900 } });
console.log('height:', h);
await browser.close();
