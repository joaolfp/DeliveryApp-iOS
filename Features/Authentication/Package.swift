// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let github = "https://github.com/"

let package = Package(
    name: "Authentication",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Authentication",
            targets: ["Authentication"]
        )
    ],
    dependencies: [
        .package(path: "../Dependencies/Coordinator"),
        .package(path: "../Dependencies/Core"),
        .package(path: "../Dependencies/DesignSystem"),
        .package(path: "../Dependencies/TestUtils"),
        .package(path: "../Dependencies/Analytics"),
        .package(
            url: "\(github)heroesofcode/MagicImages",
            exact: "1.4.0"
        ),
        .package(
            url: "\(github)pointfreeco/swift-snapshot-testing",
            exact: "1.18.1"
        )
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
