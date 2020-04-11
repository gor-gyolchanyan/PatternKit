// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PatternKit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "PatternKit",
            targets: ["PatternKit"]
        ),
    ],
    targets: [
        .target(
            name: "PatternKit"
        ),
        .testTarget(
            name: "PatternKit.Test",
            dependencies: ["PatternKit"]
        ),
    ]
)
