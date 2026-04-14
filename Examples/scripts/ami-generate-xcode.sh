#!/bin/sh
# chmod +x ami-generate-xcode.sh

# Made with AI

function check_xcodegen_installed() {
    if command -v xcodegen >/dev/null 2>&1; then
        return 0  # true
    else
        return 1  # false
    fi
}

function check_xcodegen_specification_files_exist() {
    if [ -f "ami-design-system-lab-project.yml" ] && [ -f "ami-design-system-lab-project.yml" ]; then
        return 0  # true
    else
        return 1  # false
    fi
}

if ! check_xcodegen_installed; then
    echo "Error: Xcodegen not installed, download from https://github.com/yonaskolb/XcodeGen."
elif ! check_xcodegen_specification_files_exist; then
    echo "Error: file \"ami-design-system-lab-project.yml\" or file \"ami-design-system-lab-project.yml\" not found. This command must be called from the root directory of the project."
else
    xcodegen generate --spec ami-design-system-lab-project.yml
fi