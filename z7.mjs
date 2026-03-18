import puppeteer from 'puppeteer';
const b = await puppeteer.launch({ headless:'new', args:['--no-sandbox'] });
const p = await b.newPage();
await p.setViewport({ width:1440, height:900 });
await p.goto('http://localhost:4321', { waitUntil:'networkidle2', timeout:30000 });
await new Promise(r=>setTimeout(r,3000));
await p.screenshot({ path:'temporary screenshots/v6-svc.png', clip:{x:0,y:1950,width:1440,height:950} });
await b.close();
