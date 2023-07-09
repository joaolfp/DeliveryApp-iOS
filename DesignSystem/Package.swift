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
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "10.0.0")),
        .package(url: "https://github.com/ashfurrow/Nimble-Snapshots", from: "9.4.0")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: ["Core"]),
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
