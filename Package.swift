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
        .executable(
            name: "PatternKit.Sample1",
            targets: ["PatternKit.Sample1"]
        ),
        .library(
            name: "PatternKit",
            targets: ["PatternKit"]
        ),
    ],
    targets: [
        .target(
            name: "PatternKit.Sample1",
            dependencies: ["PatternKit"]
        ),
        .target(
            name: "PatternKit"
        ),
        .testTarget(
            name: "PatternKit.Test",
            dependencies: ["PatternKit"]
        ),
    ]
)
