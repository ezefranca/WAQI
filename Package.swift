// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WAQI",
    products: [
        .library(
            name: "WAQI",
            targets: ["WAQI"]),
    ],
    targets: [
        .target(
            name: "WAQI",
            path: "Sources/WAQI"),
    ]
)


