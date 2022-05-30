// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "GildedRose",
    products: [
        .library(name: "GildedRose", targets: ["GildedRose"]),
    ],
    targets: [
        .executableTarget(name: "GildedRoseApp", dependencies: ["GildedRose"]),
        .target(name: "GildedRose", dependencies: []),
        .testTarget(name: "GildedRoseTests", dependencies: ["GildedRose"]),
    ]
)
