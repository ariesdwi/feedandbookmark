# Replace 'YourProjectName' with your actual Xcode project name
PROJECT_NAME := testdansmultipro
XCODEGEN_CMD := xcodegen
XCODEPROJ := $(PROJECT_NAME).xcodeproj

.PHONY: generate open clean all

generate:
	@echo "Generating Xcode project with XcodeGen..."
	$(XCODEGEN_CMD) generate

open:
	@echo "Opening Xcode project..."
	open $(XCODEPROJ)

clean:
	@echo "Cleaning generated project files..."
	rm -rf $(XCODEPROJ)

all: generate open

