// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ami-design-system-ios",
    platforms: [
        .iOS(.v17),
        .macOS(.v13), // prevent "unsupported platform" error
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AmiDesignSystem",
            targets: ["AmiDesignSystem"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", from: "6.6.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AmiDesignSystem",
        	path: "Sources",   
            resources: [
            	.process("Resources/Colors.xcassets"),
                .process("Resources/Icons.xcassets"),
                .copy("Resources/fonts") // embed Marianne font,
                       ],
            plugins: [
            	.plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin"),
        	]
        ),
    ]
)
