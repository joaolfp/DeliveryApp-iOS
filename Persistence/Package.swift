// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Persistence",
    products: [
        .library(
            name: "Persistence",
            targets: ["Persistence"]
        )
    ],
    targets: [
        .target(
            name: "Persistence"),
        .testTarget(
            name: "PersistenceTests",
            dependencies: ["Persistence"]
        )
    ]
)
