// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    dependencies: [
        .package(path: "./Core"),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: ["Core", "SketchKit"]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
    ]
)
