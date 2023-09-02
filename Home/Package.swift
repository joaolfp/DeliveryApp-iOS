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
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "7.2.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "12.2.0")),
        .package(url: "https://github.com/ashfurrow/Nimble-Snapshots", branch: "master"),
        .package(url: "https://github.com/joaolfp/ViewState.git", .upToNextMajor(from: "1.3.2")),
        .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Core",
                "DesignSystem",
                "Networking",
                "ViewState",
                "SketchKit"
            ]),
        .testTarget(
            name: "HomeTests",
            dependencies: [
                "Home",
                "TestUtils",
                "Quick",
                "Nimble",
                "Nimble-Snapshots",
                "ViewState"
            ],
            resources: [.copy("JSON")]
        )
    ]
)
