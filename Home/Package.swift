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
            targets: ["Home"])
    ],
    dependencies: [
        .package(path: "./Core"),
        .package(path: "./DesignSystem"),
        .package(path: "./Networking"),
        .package(path: "./TestUtils"),
        .package(url: "https://github.com/joaolfp/ViewState.git", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/heroesofcode/MagicImages", .upToNextMajor(from: "1.3.0")),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.14.2")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Core",
                "DesignSystem",
                "Networking",
                "ViewState",
                "SketchKit",
                "MagicImages"
            ]),
        .testTarget(
            name: "HomeTests",
            dependencies: [
                "Home",
                "TestUtils",
                "ViewState",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            resources: [.copy("JSON")]
        )
    ]
)
