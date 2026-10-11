# Board Buddy store screenshots

An adapted [app-store-screenshots editor](https://github.com/ParthJadhav/app-store-screenshots) by [Parth Jadhav](https://x.com/parthjadhav8). Reuses its connected canvas, inspector, device frames, file-first persistence and browser ZIP export. The `board-buddy` theme uses a Swiss Grid style in the app's colors: flat paper `#F1F1F1` / ink `#202020` slides, a 12-column hairline grid with 72px margins, a Roboto Mono index row (`BOARD BUDDY · SECTION · 01 / 08`) above a 3px rule, Inter Tight 800 headlines and exactly one red `#F73A3A` element per slide (an ink-text block bleeding off the edge on paper, a red word on ink). Phones stay upright, snap to columns and are cropped by a slide edge with at least 70% visible. Decoration is limited to `FIG.` labels, arrows and registration marks.

## Run

Node >=22 LTS recommended. Stable dependencies resolved from npm on 2026-10-08: Next 16.4.0, React 19.3.0, Tailwind CSS 4.3.3 with @tailwindcss/postcss 4.3.3, tailwind-merge 3.7.0. package-lock.json records the complete tree. No RC React, Tailwind 3, force or legacy-peer-deps.

```bash
cd store_screenshots
npm ci
npm run build
npm start -- --hostname 127.0.0.1 --port 3002
```

Editor: http://127.0.0.1:3002 . For code development: `npm run dev -- --port 3002` (stop the production server first). The production server also supports local file saves and uploads; it avoids restricted macOS FSEvents issues during dev mode.

Choose iOS/Android, device/banner and language. Edit label/headline in the inspector or on canvas, drag/resize elements, then click **Export bundle**. Each download contains every configured size and language for that device. Feature Graphic, Apple Header and Search Results have real browser exports too. Browser PNGs are encoded as actual 24-bit RGB, not opaque RGBA.

The canonical composition is `app-store-screenshots.json`, tracked in Git. The file wins over localStorage on startup; autosave is blocked until file loading succeeds. Restoring assets never reseeds the project. `scripts/seed-deck.mjs` is the Swiss Grid composition recipe for every device and locale; it refuses to overwrite an existing project unless run with `--replace` (back up the JSON first).

## Restore ignored assets after cloning

From the repository root:

```bash
python3 store_screenshots/scripts/restore-assets.py
flutter pub get
flutter test test/store_screenshots/capture_test.dart
```

Then, with the Python environment below, subset the CJK fonts to the deck's characters:

```bash
store_screenshots/.venv/bin/python store_screenshots/scripts/subset_fonts.py
```

Browser exports inline embedded fonts into every PNG; the full 16 MB CJK faces make Chrome rasterize before they load (blank ja/zh/ko text). Exports embed only the ~170 KB subsets, and only for the locales that need them. Re-run `subset_fonts.py` after changing CJK copy; `export_locales.py` refuses to run when a glyph is missing. The editor page falls back to the full fonts for new characters.

Complete capture before starting the production server; restart it after adding new image paths so Next.js discovers them.

The asset script restores the exact calibrated iPhone mockup, Inter Tight, open-source Noto CJK (regular and bold)/Devanagari fonts and the app's own font/icon. Downloads are checksum verified; unexpected upstream changes fail instead of silently changing the design. Capture uses production GamesScreen, UnoGame, CatanGame, CommonGameView, CommonGameStartScreen, CatanMapGeneratorDialog and UnoRulesScreen with actual Player models and score/undo/redo BLoC events. UNO rounds remain below the 500-point limit. Preferences are mocked, SQLite runs in a temporary directory and is removed afterward. No personal sessions are read.

All ten supported UI languages: **en, ru, de, fr, es, it, zh, ja, ko, hi**. Native interface strings come from the app's ARBs. Noto fallback is loaded into the capture theme and browser to cover CJK/Hindi. Store-only languages are documented in [ASC.md](../ASC.md); no fictional interface translations are generated for them.

## Generate and verify all exports

Set up Python once:

```bash
cd store_screenshots
python3 -m venv .venv
.venv/bin/pip install -r scripts/requirements.txt
```

With the editor running in another terminal:

```bash
.venv/bin/python scripts/export_locales.py
.venv/bin/python scripts/export_locales.py --check
.venv/bin/python scripts/check-editor.py
```

`BASE` can select another localhost server. `CHROME` can select an installed Chrome/Chromium executable; on macOS the default is Google Chrome. The browser check temporarily edits a headline and view selection, tests reload/stale-cache behavior and restores the saved project. Run it with the editor idle so another person's simultaneous edits are not overwritten.

Generation reads saved settings, waits for fonts/images, checks JS errors/text overflow, saves RGB PNGs, regenerates contacts and every archive. It creates **350 PNGs**, ten language ZIPs and the complete ZIP. There are eight screenshots per device and three banners per language, with a second iPhone size.

| Asset | Dimensions | Directory inside export/ |
|---|---|---|
| iPhone large | 1320×2868 | apple/iphone-6.9/LANG/ |
| iPhone medium | 1206×2622 | apple/iphone-6.3/LANG/ |
| iPad 13 | 2064×2752 | apple/ipad-13/LANG/ |
| Android phone | 1080×1920 | android/phone/LANG/ |
| Android Feature Graphic | 1024×500 | android/feature-graphic/LANG/ |
| Apple Header | 3840×1646 | apple/header/LANG/ |
| Apple Search Results | 3840×2560 | apple/search-results/LANG/ |

Read-only previews:

- `/preview?device=iphone&locale=en`
- `/preview?device=ipad&locale=en`
- `/preview?device=android&locale=en`
- `/preview?device=feature-graphic&locale=en&h=500`
- `/preview?device=apple-header&locale=en&h=600`
- `/preview?device=apple-search&locale=en&h=640`

Archives: `export/archives/LANG.zip`, `export/board-buddy-all.zip`. Contacts: `export/previews/` (devices, locales and banners). The public README uses only `../docs/store-preview.png`, with no service labels, numbers or editor chrome. Browser download receipts/checks live in ignored `reports/`.

QA checks exact dimensions, RGB color mode, opacity before flattening, nonblank content, localized differences, fonts/text bounds and ZIP CRC/manifests. `check-editor.py` exercises actual selectors, saving and **Export bundle**, then checks PNGs from the downloaded archives for every device/banner and language. Font fitting measures real glyphs including tracking; headlines never wrap. Display tracking is -0.045em (leading 0.9) for Latin/Cyrillic and relaxed for CJK and Devanagari. The overflow check measures text glyphs only, so edge-bleeding accent blocks are allowed. Eight-slide decks stay isolated: each asset communicates a complete benefit without hiding essential interface content across store swipes. The eight stories are scores, undo/redo, "10 games" (giant numeral over the real games list), dice, stopwatch ("01:23" numeral), saved sessions, Catan map generation and a closing feature index without a device. Every phone shows a localized production capture, including the Catan map dialog in each locale.

Capture uses widget rendering, not physical-device photography. Scores and the 83-second stopwatch are asserted; dice and Catan boards use real random generation (captured boards assert 19 tiles and nonadjacent 6/8 tokens), so their faces may differ between captures. Saved scores are read back through the real BLoC before capturing the continue dialog. Human review still matters for translations and store acceptance. Metadata is local; nothing is uploaded by these commands.

## Credits

- [app-store-screenshots](https://github.com/ParthJadhav/app-store-screenshots), [Parth Jadhav](https://x.com/parthjadhav8). [Showcase](https://www.parthjadhav.com/products/app-store-screenshots): tag **@parthjadhav8** on Twitter if you want your app added.
- [asc-metadata-sync](https://github.com/rorkai/app-store-connect-cli-skills/tree/main/skills/asc-metadata-sync), [App Store Connect CLI](https://github.com/rorkai/App-Store-Connect-CLI), [Rudrank Riyam](https://x.com/rudrank).
- [Noto fonts](https://github.com/notofonts/noto-cjk), [Google Fonts](https://github.com/google/fonts), SIL Open Font License. Used for missing CJK/Devanagari glyphs; Board Buddy's Latin/Cyrillic font remains Roboto Mono.
