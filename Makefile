# 1️⃣ make for google play
# make build MARKET=google-play

# 2️⃣ make for rustore
# make build MARKET=rustore

# 3️⃣ make show-market
# 4️⃣ help make

SHELL := /bin/bash
MARKET ?= google-play

# Target file that contains the market link used on Android
FILE := lib/config/constants/app_constants.dart

.PHONY: show-market set-google-play set-rustore build-google-play build-rustore build help

show-market:
	@line=$$(grep -A1 "static const otherAppsGooglePlayLink" $(FILE) | tail -n1); \
	if echo $$line | grep -q "play.google.com"; then \
		echo "Market: Google Play"; \
	elif echo $$line | grep -q "rustore.ru"; then \
		echo "Market: RuStore"; \
	else \
		echo "Market: Unknown (pattern not found)"; \
		exit 1; \
	fi

# Switch to Google Play: set the next-line string to Google Play URL
set-google-play:
	@sed -i '' -E "/static const otherAppsGooglePlayLink/{n; s#'[^']*'#'https://play.google.com/store/apps/developer?id=Gleb+Shalimov\&h'#; }" $(FILE)
	@$(MAKE) --no-print-directory show-market

# Switch to RuStore: set the next-line string to RuStore URL
set-rustore:
	@sed -i '' -E "/static const otherAppsGooglePlayLink/{n; s#'[^']*'#'https://www.rustore.ru/catalog/developer/xbww3r'#; }" $(FILE)
	@$(MAKE) --no-print-directory show-market

# Build for Google Play: switch link and produce AAB
build-google-play: set-google-play
	@command -v flutter >/dev/null 2>&1 || { echo "flutter not found in PATH"; exit 127; }
	flutter build appbundle --release

# Build for RuStore: switch link and produce APK
build-rustore: set-rustore
	@command -v flutter >/dev/null 2>&1 || { echo "flutter not found in PATH"; exit 127; }
	flutter build apk --release

# Unified build: choose market via MARKET=google-play|rustore (default: google-play)
build:
	@command -v flutter >/dev/null 2>&1 || { echo "flutter not found in PATH"; exit 127; }
	@if [ "$(MARKET)" = "google-play" ]; then \
		sed -i '' -E "/static const otherAppsGooglePlayLink/{n; s#'[^']*'#'https://play.google.com/store/apps/developer?id=Gleb+Shalimov\&h'#; }" $(FILE); \
		echo "Market: Google Play"; \
		flutter build appbundle --release; \
	elif [ "$(MARKET)" = "rustore" ]; then \
		sed -i '' -E "/static const otherAppsGooglePlayLink/{n; s#'[^']*'#'https://www.rustore.ru/catalog/developer/xbww3r'#; }" $(FILE); \
		echo "Market: RuStore"; \
		flutter build apk --release; \
	else \
		echo "Unknown MARKET='$(MARKET)'. Use MARKET=google-play or MARKET=rustore"; \
		exit 2; \
	fi

help:
	@echo "Usage:" \
	&& echo "  make build [MARKET=google-play|rustore]  # default MARKET=google-play" \
	&& echo "  make build-google-play                   # convenience alias" \
	&& echo "  make build-rustore                       # convenience alias" \
	&& echo "  make show-market                         # detect current link setting in file"



