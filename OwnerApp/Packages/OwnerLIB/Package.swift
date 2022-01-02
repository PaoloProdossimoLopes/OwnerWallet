// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OwnerLIB",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "OwnerLIB", targets: ["OwnerLIB"])
    ],
    dependencies: [ ],
    targets: [
        .target(name: "OwnerLIB", dependencies: []),
//        .testTarget(name: "OwnerLIBTests", dependencies: ["OwnerLIB"])
    ]
)
