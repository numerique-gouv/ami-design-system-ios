#!/bin/sh

export PATH="$PATH:/opt/homebrew/bin"

mkdir ami-design-system-lab/Sources/Generated

if command -v swiftgen >/dev/null 2>&1; then
    swiftgen config run --config Tools/SwiftGen/swiftgen-ami-design-system-lab-config.yml
else
    echo "warning: SwiftGen not installed, download from https://github.com/SwiftGen/SwiftGen"
fi