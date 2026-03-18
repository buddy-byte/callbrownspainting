import puppeteer from 'puppeteer';

const pages = [
  { url: 'http://localhost:4321/', name: 'home' },
  { url: 'http://localhost:4321/services', name: 'services' },
  { url: 'http://localhost:4321/interior-painting', name: 'interior' },
  { url: 'http://localhost:4321/contact', name: 'contact' },
  { url: 'http://localhost:4321/brewton-painting', name: 'brewton' },
  { url: 'http://localhost:4321/about', name: 'about' },
];

const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });

for (const p of pages) {
  try {
    const page = await browser.newPage();
    // iPhone 13 Pro dimensions
    await page.setViewport({ width: 390, height: 844, deviceScaleFactor: 2 });
    await page.goto(p.url, { waitUntil: 'networkidle2', timeout: 30000 });
    await new Promise(r => setTimeout(r, 1500));
    await page.screenshot({ path: `temporary screenshots/mobile-${p.name}.png`, fullPage: false });
    console.log(`✓ mobile-${p.name}`);
    await page.close();
  } catch(e) {
    console.log(`✗ ${p.name}: ${e.message}`);
  }
}

await browser.close();
console.log('Done.');
