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
        .package(path: "./Networking"),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Core",
                "DesignSystem",
                "Networking",
                "SketchKit"]),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]),
    ]
)
