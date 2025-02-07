# Defining variables for all scripts
SCRIPTS_DIR := scripts
CODEGEN_SCRIPT := $(SCRIPTS_DIR)/build_runner.sh
FORMAT_SCRIPT := $(SCRIPTS_DIR)/format.sh
SPIDER_BUILD_SCRIPT := $(SCRIPTS_DIR)/spider_build.sh
CLEAN_IOS_SCRIPT := $(SCRIPTS_DIR)/clean_ios.sh

# Tasks to run each script
codegen:
	sh $(CODEGEN_SCRIPT)

format:
	sh $(FORMAT_SCRIPT)

spider:
	sh $(SPIDER_BUILD_SCRIPT)

clean_ios:
	sh $(CLEAN_IOS_SCRIPT)

# By default, we display a message about available tasks
all:
	@echo "Available tasks:"
	@echo " - codegen: build_runner build & dart format"
	@echo " - format: Formats the code."
	@echo " - spider: Runs spider build, formats the code, runs golden tests."

# for FVM
clean:
        fvm flutter clean

get:
        fvm flutter pub get

prepare:
        make clean
        make get

format:
        fvm dart format -l 120 .

build_runner:
        fvm flutter pub run build_runner build --delete-conflicting-outputs

run:
        fvm flutter run