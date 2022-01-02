// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "OwnerHome",
    platforms: [.iOS(.v13)],
    products: [.library(name: "OwnerHome", targets: ["OwnerHome"])],
    dependencies: [.package(name: "OwnerLIB", path: "../OwnerLIB")],
    targets: [
        .target(name: "OwnerHome", dependencies: ["OwnerLIB"]),
        .testTarget(name: "OwnerHomeTests",dependencies: ["OwnerHome"]),
    ]
)
