// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Authentication",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Authentication",
            targets: ["Authentication"]),
    ],
    dependencies: [
        .package(path: "./Coordinator"),
        .package(path: "./Core"),
        .package(path: "./DesignSystem"),
        .package(path: "./TestUtils"),
        .package(path: "./Analytics"),
        .package(url: "https://github.com/heroesofcode/MagicImages", .upToNextMajor(from: "1.4.0")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.2")
    ],
    targets: [
        .target(
            name: "Authentication",
            dependencies: [
                "Coordinator",
                "Core",
                "DesignSystem",
                "MagicImages",
                "Analytics"
            ],
            resources: [
                .process("Localizable")
            ]
        ),
        .testTarget(
            name: "AuthenticationTests",
            dependencies: [
                "Authentication",
                "TestUtils",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
