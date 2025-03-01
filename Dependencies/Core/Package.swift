// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Core",
            targets: ["Core"]
        )
    ],
    dependencies: [
        .package(path: "./Networking")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                "Networking"
            ]
        ),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]
        )
    ]
)
