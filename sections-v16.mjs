import puppeteer from 'puppeteer';

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.setViewport({ width: 1440, height: 900 });
await page.goto('http://localhost:4321', { waitUntil: 'networkidle2' });
await new Promise(r => setTimeout(r, 2000));

const sections = [
  { sel: '.feature-section', name: 'about' },
  { sel: '.services-section', name: 'services' },
  { sel: '.why-section', name: 'why' },
  { sel: '.process-section', name: 'process' },
  { sel: '.areas-section', name: 'areas' },
];

for (const s of sections) {
  try {
    const el = await page.$(s.sel);
    if (el) {
      await el.screenshot({ path: `temporary screenshots/v16-${s.name}.png` });
      console.log('saved v16-' + s.name);
    }
  } catch(e) { console.log('skip', s.name, e.message); }
}
await browser.close();
