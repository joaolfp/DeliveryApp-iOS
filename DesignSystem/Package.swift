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
        .package(path: "./Core"),
        .package(path: "./TestUtils"),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "7.2.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "12.2.0")),
        .package(url: "https://github.com/joaolfp/Nimble-Snapshots", branch: "1.0.0"),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/heroesofcode/MagicImages", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                "Core",
                "SketchKit",
                "MagicImages"
            ]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: [
                "DesignSystem",
                "TestUtils",
                "Core",
                "Quick",
                "Nimble",
                "Nimble-Snapshots"
            ]
        )
    ]
)
