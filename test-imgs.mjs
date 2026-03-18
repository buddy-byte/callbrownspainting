import puppeteer from 'puppeteer';
const b = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
const p = await b.newPage();
await p.setViewport({ width: 1440, height: 300 });

const imgs = ['project-3','project-4','project-5','project-6','project-7','project-8','project-9','project-10','door-stain-optimized','interior-detail-1-optimized'];

for (const img of imgs) {
  const url = `http://localhost:4321/images/projects/projects-optimized/${img}.jpg`;
  const html = `<!DOCTYPE html><html><body style="margin:0;background:#000"><img src="${url}" style="width:300px;height:200px;object-fit:cover;display:block"></body></html>`;
  await p.setContent(html, { waitUntil: 'networkidle2' });
  await new Promise(r => setTimeout(r, 800));
  await p.screenshot({ path: `temporary screenshots/ti-${img}.png`, clip: { x: 0, y: 0, width: 300, height: 200 } });
  console.log('tested:', img);
}

await b.close();
console.log('all done');
