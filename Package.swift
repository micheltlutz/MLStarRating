// swift-tools-version:4.1
//
//  MLStarRating.swift
//  MLStarRating
//
//  Created by Michel Anderson Lutz Teixeira on 23/10/15.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MLStarRating",
    products: [
        .library(
            name: "MLStarRating",
            targets: ["MLStarRating"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "MLStarRating",
            dependencies: ["UIKit"],
            path: "Sources"),
        .testTarget(
            name: "MLStarRatingTests",
            dependencies: ["MLStarRating"],
            path: "Tests")
    ]
)
