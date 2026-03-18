// screenshot.mjs — Puppeteer screenshot for design review loop
// Usage: node screenshot.mjs <url> [label]
// Examples:
//   node screenshot.mjs http://localhost:3000
//   node screenshot.mjs http://localhost:3000 hero
//   node screenshot.mjs http://localhost:3000 after-fix
//
// Saves to: ./temporary screenshots/screenshot-N.png  (or screenshot-N-label.png)
// Never overwrites — always increments N.
// Copy this file to your website project root before running.

import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const url = process.argv[2];
const label = process.argv[3] || null;

if (!url) {
  console.error('Usage: node screenshot.mjs <url> [label]');
  process.exit(1);
}

const screenshotDir = path.join(__dirname, 'temporary screenshots');
if (!fs.existsSync(screenshotDir)) {
  fs.mkdirSync(screenshotDir, { recursive: true });
}

// Auto-increment N — never overwrite existing screenshots
function getNextFilename(label) {
  const existing = fs.readdirSync(screenshotDir)
    .filter(f => f.startsWith('screenshot-') && f.endsWith('.png'))
    .map(f => parseInt(f.match(/screenshot-(\d+)/)?.[1] || '0'))
    .filter(n => !isNaN(n));
  const next = existing.length > 0 ? Math.max(...existing) + 1 : 1;
  return label ? `screenshot-${next}-${label}.png` : `screenshot-${next}.png`;
}

const browser = await puppeteer.launch({
  headless: 'new',
  args: ['--no-sandbox', '--disable-setuid-sandbox']
});

try {
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 900 });
  await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
  // Wait for animations to settle
  await new Promise(r => setTimeout(r, 1500));

  const filename = getNextFilename(label);
  const outputPath = path.join(screenshotDir, filename);

  await page.screenshot({ path: outputPath, fullPage: true });
  console.log(`Screenshot saved: temporary screenshots/${filename}`);
} finally {
  await browser.close();
}
