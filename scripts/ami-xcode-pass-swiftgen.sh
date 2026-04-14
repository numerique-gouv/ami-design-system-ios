#!/bin/sh

export PATH="$PATH:/opt/homebrew/bin"

mkdir AmiDesignKit/Sources/Swift/Generated

if command -v swiftgen >/dev/null 2>&1; then
    swiftgen config run --config Tools/SwiftGen/swiftgen-ami-design-kit-ios-config.yml
else
    echo "warning: SwiftGen not installed, download from https://github.com/SwiftGen/SwiftGen"
fi
