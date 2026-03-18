import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2' });
await new Promise(r => setTimeout(r, 2500));

// 6 viewport-height slices down the page
const snapshots = [
  { y: 0,    name: '1-hero' },
  { y: 900,  name: '2-stats-about' },
  { y: 1800, name: '3-services' },
  { y: 2700, name: '4-testi' },
  { y: 3600, name: '5-why' },
  { y: 4500, name: '6-process-areas' },
];

for (const s of snapshots) {
  await page.evaluate(y => window.scrollTo(0, y), s.y);
  await new Promise(r => setTimeout(r, 400));
  await page.screenshot({
    path: `temporary screenshots/v16-slice-${s.name}.png`,
    clip: { x: 0, y: 0, width: 1440, height: 900 }
  });
  console.log('saved', s.name);
}

await browser.close();
