// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "7.2.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "12.2.0"))
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: []),
        .testTarget(
            name: "NetworkingTests",
            dependencies: [
                "Networking",
                "Quick",
                "Nimble"
            ])
    ]
)
