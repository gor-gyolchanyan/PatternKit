// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PredicateKit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "PredicateKit",
            targets: ["PredicateKit"]
        ),
    ],
    targets: [
        .target(
            name: "PredicateKit"
        ),
        .testTarget(
            name: "PredicateKit.Test",
            dependencies: ["PredicateKit"]
        ),
    ]
)
