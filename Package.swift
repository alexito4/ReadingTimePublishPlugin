// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ReadingTimePublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "ReadingTimePublishPlugin",
            targets: ["ReadingTimePublishPlugin"]
        ),
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "ReadingTimePublishPlugin",
            dependencies: ["Publish"]
        ),
        .testTarget(
            name: "ReadingTimePublishPluginTests",
            dependencies: ["ReadingTimePublishPlugin"]
        ),
    ]
)
