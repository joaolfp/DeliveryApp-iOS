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
            targets: ["DesignSystem"])
    ],
    dependencies: [
        .package(path: "./Core")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: ["Core"]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"])
    ]
)
