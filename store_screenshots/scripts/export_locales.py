"""Export saved decks, validate PNGs, refresh contact sheets and every ZIP.
Requires: pip install -r scripts/requirements.txt; locally running editor.
"""
import argparse
import asyncio
import io
import json
import os
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
from PIL import Image, ImageDraw, ImageStat
from playwright.async_api import async_playwright
from subset_fonts import missing as missing_cjk_glyphs

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'export'
# Exactly the sizes selected in the editor. Keep this list in sync with constants.ts.
SIZES = [
    ('iphone',1320,2868,'apple/iphone-6.9'),
    ('iphone',1206,2622,'apple/iphone-6.3'),
    ('ipad',2064,2752,'apple/ipad-13'),
    ('android',1080,1920,'android/phone'),
    ('feature-graphic',1024,500,'android/feature-graphic'),
    ('apple-header',3840,1646,'apple/header'),
    ('apple-search',3840,2560,'apple/search-results'),
]

def jobs(state):
    for locale in state['locales']:
        for device,w,h,folder in SIZES:
            for index,_ in enumerate(state['slidesByDevice'][device]):
                url=f'/preview?device={device}&locale={locale}&bare&from={index}&n=1&width={w}&height={h}'
                yield url,w,h,OUT/folder/locale/f'{index+1:02d}.png'

def check_png(data,w,h,name):
    with Image.open(io.BytesIO(data)) as im:
        assert im.size==(w,h),(name,im.size)
        assert im.mode in ('RGB','RGBA'),(name,im.mode)
        if im.mode=='RGBA': assert im.getchannel('A').getextrema()==(255,255),(name,'Transparency')
        assert max(ImageStat.Stat(im.convert('RGB')).stddev)>8,(name,'Blank PNG')
        rgb=im.convert('RGB')
        # Every edge must have opaque content; alpha is checked before RGB conversion.
        assert all(rgb.getpixel(p) for p in [(0,0),(w-1,0),(0,h-1),(w-1,h-1)])

def check(state):
    for _,w,h,path in jobs(state):
        check_png(path.read_bytes(),w,h,str(path.relative_to(ROOT)))
        assert Image.open(path).mode=='RGB',(path,'Expected 24-bit PNG')
    # Each localization must differ from English (both captions and actual UI).
    for device,_,_,folder in SIZES:
        hashes=[(OUT/folder/loc/'01.png').read_bytes() for loc in state['locales']]
        assert len(set(hashes))==len(hashes),(device,'Duplicate locale PNGs')
    expected={str(path.relative_to(OUT)) for *_,path in jobs(state)}
    with ZipFile(OUT/'board-buddy-all.zip') as z:
        assert z.testzip() is None
        assert set(z.namelist())==expected,('ZIP contents',set(z.namelist())^expected)
    for locale in state['locales']:
        with ZipFile(OUT/'archives'/f'{locale}.zip') as z:
            assert z.testzip() is None
            assert set(z.namelist())=={name for name in expected if f'/{locale}/' in name}
    print(f'QA passed: {len(expected)} RGB PNGs, unique localizations, exact ZIP manifests',flush=True)

def sheet(paths,dest,columns=4,labels=True):
    width,height=300,680
    thumb_height=height-32 if labels else height
    rows=(len(paths)+columns-1)//columns
    out=Image.new('RGB',(width*columns,height*rows),'#dedede')
    draw=ImageDraw.Draw(out)
    for i,path in enumerate(paths):
        im=Image.open(path).convert('RGB');im.thumbnail((width-16,thumb_height-16))
        x=(i%columns)*width+(width-im.width)//2;y=(i//columns)*height+8
        out.paste(im,(x,y))
        if labels: draw.text(((i%columns)*width+8,(i//columns+1)*height-24),str(path.relative_to(OUT)),fill='#202020')
    dest.parent.mkdir(parents=True,exist_ok=True);out.save(dest)

def package(state):
    paths=[p for *_,p in jobs(state)]
    (OUT/'archives').mkdir(parents=True,exist_ok=True)
    for locale in state['locales']:
        selected=[p for p in paths if p.parent.name==locale]
        with ZipFile(OUT/'archives'/f'{locale}.zip','w',ZIP_DEFLATED) as z:
            for p in selected:z.write(p,str(p.relative_to(OUT)))
        sheet([p for p in selected if 'iphone-6.9' in str(p)],OUT/'previews'/f'locale-{locale}.jpg')
    with ZipFile(OUT/'board-buddy-all.zip','w',ZIP_DEFLATED) as z:
        for p in paths:z.write(p,str(p.relative_to(OUT)))
    for device in ['iphone-6.9','ipad-13','phone']:
        sheet([p for p in paths if device in p.parts and p.parent.name=='en'],OUT/'previews'/f'{device}.jpg')
    sheet([OUT/folder/loc/'01.png' for dev,_,_,folder in SIZES if dev=='iphone' and '6.9' in folder for loc in state['locales']],OUT/'previews/locales.jpg',columns=5)
    banner_paths=[p for p in paths if any(x in p.parts for x in ['header','search-results','feature-graphic'])]
    # Banners have separate, readable landscape contact sheets.
    for locale in state['locales']:
        images=[]
        for p in banner_paths:
            if p.parent.name==locale:
                im=Image.open(p).convert('RGB');im.thumbnail((960,640));images.append(im)
        contact=Image.new('RGB',(960,sum(im.height+16 for im in images)),'#dedede');y=0
        for im in images:contact.paste(im,((960-im.width)//2,y));y+=im.height+16
        contact.save(OUT/'previews'/f'banners-{locale}.jpg')
    sheet([p for p in paths if 'iphone-6.9' in p.parts and p.parent.name=='en'],ROOT.parent/'docs/store-preview.png',labels=False)

async def export(state,base):
    gaps=missing_cjk_glyphs(state)
    assert not gaps,f'CJK subset lacks {"".join(sorted(gaps))}; run scripts/subset_fonts.py'
    semaphore=asyncio.Semaphore(2)
    async with async_playwright() as p:
        browser=await p.chromium.launch(executable_path=os.environ.get('CHROME','/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'),headless=True)
        async def render(job):
            url,w,h,path=job
            async with semaphore:
                page=await browser.new_page(viewport={'width':w,'height':h},device_scale_factor=1)
                errors=[];page.on('pageerror',lambda e:errors.append(str(e)))
                try:
                    await page.goto(base+url,wait_until='domcontentloaded')
                    await page.wait_for_selector('[data-export-slide]')
                    await page.evaluate('document.fonts.ready')
                    await page.wait_for_function('''() => [...document.images].every(i=>i.complete&&i.naturalWidth>0)''',timeout=120000)
                    await page.wait_for_timeout(250)
                    assert await page.evaluate('document.fonts.check("16px RobotoMono") && document.fonts.check("800 16px InterTight")'),url
                    # Glyph boxes only: accent blocks intentionally bleed past their text box.
                    overflow=await page.evaluate('''() => [...document.querySelectorAll('[data-fit-text]')].filter(el=>!el.closest('[style*="rotate("]')).flatMap(el=>{
                        const box=el.getBoundingClientRect();const walk=document.createTreeWalker(el,NodeFilter.SHOW_TEXT);const rects=[];
                        for(let n=walk.nextNode();n;n=walk.nextNode()){const r=document.createRange();r.selectNodeContents(n);rects.push(...r.getClientRects());}
                        return rects.some(b=>b.left<box.left-2||b.right>box.right+2)?[el.innerText]:[];
                    })''')
                    assert not errors,(url,errors)
                    assert not overflow,(url,'Overflow',overflow)
                    collisions=await page.evaluate('''() => [...document.querySelectorAll('[data-bleed]')].flatMap(block=>{
                        const b=block.getBoundingClientRect();
                        return [...document.querySelectorAll('[data-fit-text]')].filter(el=>!el.contains(block)&&!block.contains(el)&&!el.closest('[style*="rotate("]')).flatMap(el=>{
                            const range=document.createRange();range.selectNodeContents(el);
                            return [...range.getClientRects()].some(r=>r.left<b.right&&r.right>b.left&&r.top<b.bottom&&r.bottom>b.top)?[el.innerText]:[];
                        });
                    })''')
                    assert not collisions,(url,'Accent overlaps text',collisions)
                    path.parent.mkdir(parents=True,exist_ok=True)
                    data=await page.screenshot(animations='disabled')
                    check_png(data,w,h,url)
                    Image.open(io.BytesIO(data)).convert('RGB').save(path)
                    print(path.relative_to(ROOT),flush=True)
                finally:await page.close()
        try:await asyncio.gather(*(render(job) for job in jobs(state)))
        finally:await browser.close()
    package(state);check(state)

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    state=json.loads((ROOT/'app-store-screenshots.json').read_text())
    if args.check:check(state)
    else:asyncio.run(export(state,os.environ.get('BASE','http://127.0.0.1:3002')))
