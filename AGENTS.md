# Agent instructions

- Prefix shell commands with `rtk`; use `rtk proxy` when no wrapper exists.
- Preserve unrelated user changes. Keep replies concise.
- For screenshot tasks, use the installed `app-store-screenshots` skill and read `store_screenshots/README.md`. Reuse the editor, production widgets and real models/events.
- UI locales come from `LanguageService.supportedLanguageCodes`, the generated localization delegate and `MaterialApp`; store-only locales do not extend UI support.
- Capture tests belong in `test/store_screenshots/`. Mock preferences and use an isolated temporary database; never read personal game sessions.
- Save composition in `store_screenshots/app-store-screenshots.json`. The file is canonical; stale browser cache must never overwrite it on startup.
- After any visual change, regenerate every affected PNG, contact preview, locale ZIP and the complete ZIP. Exercise the real browser export button and inspect PNGs inside its download.
- For App Store Connect work, read `ASC.md` and use installed `asc-metadata-sync` and `asc-cli-usage` skills; use `asc-id-resolver` when resolving IDs and `asc-screenshot-resize` when changing accepted sizes. Discover flags with `asc <command> --help`.
- Always specify the project auth profile from `.asc/project.json`. Never change global auth defaults. Pull into a fresh snapshot directory; never overwrite locally edited metadata.
- Validate canonical metadata locally before any separately authorized remote write. Keep supplied copy, existing URLs and release notes; label new drafts explicitly.
- Store metadata, captures, fonts/mockups downloaded for store work, exports, ZIPs, reports and secrets stay local and ignored. `docs/store-preview.png` is the single explicit public README image exception.
- Restore missing local assets with `restore-assets.py` and the Flutter capture test after cloning. Never reseed or reset saved decks just to restore images.
- No upload, version creation, review submission, publication or Product Page Optimization without a separate user request.
- If separately asked to replace live screenshots without a new version, check current Apple PPO/Asset Library documentation and ASC CLI support before advising whether a new version is necessary.
