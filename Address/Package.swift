// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Address",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Address",
            targets: ["Address"]
        )
    ],
    dependencies: [
        .package(path: "./Coordinator"),
        .package(path: "./Core"),
        .package(path: "./DesignSystem"),
        .package(path: "./Networking"),
        .package(path: "./TestUtils"),
        .package(path: "./Persistence"),
        .package(path: "./Analytics"),
        .package(url: "https://github.com/joaolfp/ViewState", .upToNextMajor(from: "1.6.0")),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/heroesofcode/MagicImages", .upToNextMajor(from: "1.4.0")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.2")
    ],
    targets: [
        .target(
            name: "Address",
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
            name: "AddressTests",
            dependencies: [
                "Address",
                "TestUtils",
                "ViewState",
                "Persistence",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            resources: [.copy("JSON")]
        )
    ]
)
