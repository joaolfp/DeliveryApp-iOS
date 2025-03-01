// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let github = "https://github.com/"

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
        .package(
            url: "\(github)joaolfp/ViewState",
            exact: "1.6.0"
        ),
        .package(
            url: "\(github)dogo/SketchKit",
            exact: "2.0.0"
        ),
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
