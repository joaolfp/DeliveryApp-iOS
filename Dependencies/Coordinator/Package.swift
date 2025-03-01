// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Coordinator",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Coordinator",
            targets: ["Coordinator"]
        )
    ],
    targets: [
        .target(
            name: "Coordinator"),
        .testTarget(
            name: "CoordinatorTests",
            dependencies: ["Coordinator"]
        )
    ]
)
