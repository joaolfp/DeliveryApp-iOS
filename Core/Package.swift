// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["Core"])
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: []),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"])
    ]
)
