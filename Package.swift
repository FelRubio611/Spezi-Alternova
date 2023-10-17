// swift-tools-version:5.8

//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "Spezi-Alternova",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "Spezi-Alternova", targets: ["Spezi-Alternova"]),
        .library(name: "XCTSpezi", targets: ["XCTSpezi"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordBDHG/XCTRuntimeAssertions", .upToNextMinor(from: "0.2.5"))
    ],
    targets: [
        .target(
            name: "Spezi-Alternova",
            dependencies: [
                .product(name: "XCTRuntimeAssertions", package: "XCTRuntimeAssertions")
            ]
        ),
        .target(
            name: "XCTSpezi",
            dependencies: [
                .target(name: "Spezi-Alternova")
            ]
        ),
        .testTarget(
            name: "SpeziTests",
            dependencies: [
                .target(name: "Spezi-Alternova"),
                .target(name: "XCTSpezi"),
                .product(name: "XCTRuntimeAssertions", package: "XCTRuntimeAssertions")
            ]
        )
    ]
)
