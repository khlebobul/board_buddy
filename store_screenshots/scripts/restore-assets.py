"""Restore ignored assets after cloning. Run from any directory; never modifies saved decks."""
from pathlib import Path
import hashlib
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
PUBLIC = ROOT / 'public'
SOURCES = {
    'mockup.png': 'https://raw.githubusercontent.com/ParthJadhav/app-store-screenshots/4fa2e90839d43e15cb78170759265b0793baf804/skills/app-store-screenshots/template/public/mockup.png',
    'fonts/NotoSansCJK.otf': 'https://raw.githubusercontent.com/notofonts/noto-cjk/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf',
    'fonts/NotoSansCJKBold.otf': 'https://raw.githubusercontent.com/notofonts/noto-cjk/main/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Bold.otf',
    'fonts/NotoSansDevanagari.ttf': 'https://raw.githubusercontent.com/google/fonts/main/ofl/notosansdevanagari/NotoSansDevanagari%5Bwdth,wght%5D.ttf',
    'fonts/InterTight.ttf': 'https://raw.githubusercontent.com/google/fonts/main/ofl/intertight/InterTight%5Bwght%5D.ttf',
}
CHECKSUMS = {'mockup.png': 'ee21a4d5644c17ec9c86d81583b9d4b0a6b6cfb57771f4e45f879a7e19003415', 'fonts/NotoSansCJK.otf': '2c76254f6fc379fddfce0a7e84fb5385bb135d3e399294f6eeb6680d0365b74b', 'fonts/NotoSansCJKBold.otf': 'b5f0d1a190a7f9b43c310a8850630af12553df32c4c050543f9059732d9b4c0a', 'fonts/NotoSansDevanagari.ttf': '14ec4af41f27482216d1c2229f417ff9b1425e1babb014e57d1d40d03229853e', 'fonts/InterTight.ttf': 'b81b73dcb64df3c230cabade7df6c5773bf863233f24c9ee51087519f1f88b6f'}  # Filled from the exact assets used to calibrate frames and typography.

def restore():
    for name, url in SOURCES.items():
        dest = PUBLIC / name
        dest.parent.mkdir(parents=True, exist_ok=True)
        if not dest.exists():
            data = subprocess.check_output(['curl', '--fail', '--location', '--silent', '--show-error', '--max-time', '60', url])
            assert hashlib.sha256(data).hexdigest() == CHECKSUMS[name], f'Upstream asset changed: {name}'
            dest.write_bytes(data)
        assert hashlib.sha256(dest.read_bytes()).hexdigest() == CHECKSUMS[name], f'Asset checksum mismatch: {name}'
    shutil.copyfile(ROOT.parent / 'assets/fonts/roboto_mono.ttf', PUBLIC / 'fonts/RobotoMono.ttf')
    shutil.copyfile(ROOT.parent / 'assets/logo/logo.png', PUBLIC / 'app-icon.png')
    print('Frames, icon and fonts restored. Run Flutter capture next.')

if __name__ == '__main__':
    restore()
