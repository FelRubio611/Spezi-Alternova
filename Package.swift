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
    name: "SpeziAlternova",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "SpeziAlternova", targets: ["SpeziAlternova"]),
        .library(name: "XCTSpeziAlternova", targets: ["XCTSpeziAlternova"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordBDHG/XCTRuntimeAssertions", .upToNextMinor(from: "0.2.5"))
    ],
    targets: [
        .target(
            name: "SpeziAlternova",
            dependencies: [
                .product(name: "XCTRuntimeAssertions", package: "XCTRuntimeAssertions")
            ]
        ),
        .target(
            name: "XCTSpeziAlternova",
            dependencies: [
                .target(name: "SpeziAlternova")
            ]
        ),
        .testTarget(
            name: "SpeziAlternovaTests",
            dependencies: [
                .target(name: "SpeziAlternova"),
                .target(name: "XCTSpeziAlternova"),
                .product(name: "XCTRuntimeAssertions", package: "XCTRuntimeAssertions")
            ]
        )
    ]
)
