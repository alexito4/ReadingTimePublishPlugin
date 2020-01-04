// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ReadingTimePublishPlugin",
    products: [
        .library(
            name: "ReadingTimePublishPlugin",
            targets: ["ReadingTimePublishPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "ReadingTimePublishPlugin",
            dependencies: ["Publish"]),
        .testTarget(
            name: "ReadingTimePublishPluginTests",
            dependencies: ["ReadingTimePublishPlugin"]),
    ]
)
