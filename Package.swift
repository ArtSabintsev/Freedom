// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Freedom",
    products: [.library(name: "Freedom", targets: ["Freedom"])],
    targets: [.target(name: "Freedom", path: "Sources")]
)
