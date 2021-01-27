// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ReadingTimePublishPlugin",
    products: [
        .library(
            name: "ReadingTimePublishPlugin",
            targets: ["ReadingTimePublishPlugin"]),
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0"),
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
