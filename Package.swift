// swift-tools-version: 5.9.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PixelBin",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PixelBin",
            targets: ["PixelBin"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PixelBin",
            path: "Sources/PixelBin"
        ),
        .testTarget(
            name: "PixelBinTests",
            dependencies: ["PixelBin"],
            path: "Tests/PixelBinTests"
        ),
    ]
)
