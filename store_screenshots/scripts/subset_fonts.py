"""Subset the CJK fonts to the characters used by the saved deck.

Browser exports inline embedded fonts into every PNG render; the full 16 MB
faces make Chrome rasterize Japanese/Chinese/Korean text before it loads.
Re-run after changing CJK copy. The page itself falls back to the full fonts.
"""
import json
from pathlib import Path
from fontTools import subset
from fontTools.ttLib import TTFont

ROOT = Path(__file__).resolve().parents[1]
FONTS = ROOT / 'public/fonts'
PAIRS = [('NotoSansCJK.otf', 'NotoSansCJK-subset.otf'), ('NotoSansCJKBold.otf', 'NotoSansCJKBold-subset.otf')]


def deck_text(state):
    out = set(''.join(chr(c) for c in range(0x20, 0x7f)) + '。、？！：；·—→←「」（）')
    def walk(value):
        if isinstance(value, str):
            out.update(value)
        elif isinstance(value, dict):
            for v in value.values(): walk(v)
        elif isinstance(value, list):
            for v in value: walk(v)
    walk(state)
    out.discard('\n')
    return out


def missing(state):
    """CJK characters in the deck that the current subset can't render."""
    need = {c for c in deck_text(state) if ord(c) >= 0x2e80}
    gaps = set()
    for _, name in PAIRS:
        cmap = TTFont(FONTS / name, lazy=True).getBestCmap()
        gaps |= {c for c in need if ord(c) not in cmap}
    return gaps


def build():
    state = json.loads((ROOT / 'app-store-screenshots.json').read_text())
    text = ''.join(sorted(deck_text(state)))
    for source, target in PAIRS:
        options = subset.Options()
        options.layout_features = ['*']
        options.name_IDs = ['*']
        font = subset.load_font(str(FONTS / source), options)
        subsetter = subset.Subsetter(options)
        subsetter.populate(text=text)
        subsetter.subset(font)
        subset.save_font(font, str(FONTS / target), options)
        print(f'{target}: {(FONTS / target).stat().st_size // 1024} KB')
    assert not missing(state)


if __name__ == '__main__':
    build()
