// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let github = "https://github.com/"

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        )
    ],
    dependencies: [
        .package(path: "./Core"),
        .package(path: "./TestUtils"),
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
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
