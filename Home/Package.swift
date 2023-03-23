// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]),
    ],
    dependencies: [
        .package(path: "./Core"),
        .package(path: "./DesignSystem"),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: ["Core", "DesignSystem", "SketchKit"]),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]),
    ]
)
