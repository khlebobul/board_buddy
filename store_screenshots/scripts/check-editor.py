"""Exercise the real editor: stale cache, text/save/reload, selectors and downloaded ZIPs."""
import asyncio
import argparse
import io
import json
import os
from pathlib import Path
from zipfile import ZipFile
from playwright.async_api import async_playwright
from export_locales import ROOT, SIZES, check_png

async def check(devices=None):
    original=(ROOT/'app-store-screenshots.json').read_text()
    state=json.loads(original)
    reports=ROOT/'reports';reports.mkdir(exist_ok=True)
    base=os.environ.get('BASE','http://127.0.0.1:3002')
    async with async_playwright() as p:
        browser=await p.chromium.launch(executable_path=os.environ.get('CHROME','/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'),headless=True)
        context=await browser.new_context(accept_downloads=True,viewport={'width':1600,'height':1000})
        stale={**state,'appName':'STALE CACHE MUST NOT WIN'}
        await context.add_init_script('localStorage.setItem("board-buddy:store-project:v2", '+json.dumps(json.dumps(stale))+');')
        page=await context.new_page();errors=[]
        page.on('pageerror',lambda e: errors.append(str(e)))
        try:
            await page.goto(base,wait_until='domcontentloaded')
            await page.get_by_role('button',name='Export bundle',exact=True).wait_for(timeout=60000)
            await page.wait_for_timeout(1200)
            assert await page.get_by_role('textbox',name='App name',exact=True).input_value()==state['appName']
            assert json.loads((ROOT/'app-store-screenshots.json').read_text())['appName']==state['appName']
            # Edit through the inspector; verify persistence after reload, then restore text.
            headline=page.locator('textarea').first
            text=await headline.input_value()
            await headline.fill(text+'!')
            await page.wait_for_timeout(1200)
            assert json.loads((ROOT/'app-store-screenshots.json').read_text())['slidesByDevice']['iphone'][0]['headline']['en']==text+'!'
            await page.reload(wait_until='domcontentloaded')
            await page.get_by_role('button',name='Export bundle',exact=True).wait_for(timeout=60000)
            assert await page.locator('textarea').first.input_value()==text+'!'
            await page.locator('textarea').first.fill(text)
            await page.wait_for_timeout(1200)
            await page.screenshot(path=str(reports/'editor.png'))
            for device,label in [('iphone','iPhone'),('ipad','iPad'),('apple-header','Apple Header'),('apple-search','Apple Search Results'),('android','Android Phone'),('feature-graphic','Feature Graphic')]:
                if devices and device not in devices: continue
                if device in ('android','feature-graphic'):await page.get_by_role('tab',name='Android',exact=True).click()
                await page.get_by_role('combobox').nth(0).click()
                await page.get_by_role('option',name=label,exact=True).click()
                await page.wait_for_timeout(1000)
                async with page.expect_download(timeout=600000) as download_info:
                    await page.get_by_role('button',name='Export bundle',exact=True).click()
                download=await download_info.value
                path=reports/f'{device}-browser-export.zip'
                await download.save_as(str(path))
                expected=sum(1 for d,*_ in SIZES if d==device)*len(state['locales'])*len(state['slidesByDevice'][device])
                with ZipFile(path) as z:
                    assert z.testzip() is None
                    names=[n for n in z.namelist() if n.endswith('.png')]
                    assert len(names)==expected,(device,len(names),expected)
                    platform='android' if device in ('android','feature-graphic') else 'ios'
                    manifest={f'{platform}/{device}/{w}x{h}/{locale}/{i+1:02d}-{slide["layout"]}.png' for d,w,h,_ in SIZES if d==device for locale in state['locales'] for i,slide in enumerate(state['slidesByDevice'][device])}
                    assert set(names)==manifest,(device,'Unexpected ZIP manifest')
                    for name in names:
                        _,_,dims,locale,file=name.split('/')
                        w,h=map(int,dims.split('x'))
                        assert locale in state['locales']
                        check_png(z.read(name),w,h,name)
                        from PIL import Image
                        assert Image.open(io.BytesIO(z.read(name))).mode=="RGB",(name,"Expected 24-bit RGB")
                    # A contact sheet from actual downloaded PNGs, one per locale.
                    from PIL import Image
                    contact=Image.new('RGB',(150*5,340*2),'#dedede')
                    for i,locale in enumerate(state['locales']):
                        name=next(n for n in names if f'/{locale}/01-' in n)
                        im=Image.open(io.BytesIO(z.read(name))).convert('RGB');im.thumbnail((146,336))
                        contact.paste(im,((i%5)*150,(i//5)*340))
                    contact.save(reports/f'{device}-downloaded-preview.jpg')
                print(f'Real button: {device}, {expected} PNGs validated',flush=True)
            assert not errors,errors
            print('Editor QA passed: canonical file wins, text survives reload, requested real export buttons',flush=True)
        finally:
            await context.close();await browser.close()
            # Browser autosaves navigation and QA edits; restore the canonical view and copy exactly.
            (ROOT/'app-store-screenshots.json').write_text(original)

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--devices',nargs='+',choices=['iphone','ipad','android','feature-graphic','apple-header','apple-search'])
    asyncio.run(check(parser.parse_args().devices))
