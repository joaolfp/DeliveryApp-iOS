// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]
        )
    ],
    dependencies: [
        .package(path: "../Dependencies/Coordinator"),
        .package(path: "../Dependencies/Core"),
        .package(path: "../Dependencies/DesignSystem"),
        .package(path: "../Dependencies/Networking"),
        .package(path: "../Dependencies/TestUtils"),
        .package(path: "../Dependencies/Persistence"),
        .package(path: "../Dependencies/Analytics"),
        .package(url: "https://github.com/joaolfp/ViewState", .upToNextMajor(from: "1.6.0")),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/heroesofcode/MagicImages", .upToNextMajor(from: "1.4.0")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.4")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Coordinator",
                "Core",
                "DesignSystem",
                "Networking",
                "ViewState",
                "SketchKit",
                "MagicImages",
                "Persistence",
                "Analytics"
            ],
            resources: [
                .process("Localizable")
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: [
                "Home",
                "TestUtils",
                "ViewState",
                "Persistence",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            resources: [.copy("JSON")]
        )
    ]
)
