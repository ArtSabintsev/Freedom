// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Freedom",
    platforms: [.iOS(.v9)],  
    products: [.library(name: "Freedom", targets: ["Freedom"])],
    targets: [.target(name: "Freedom", path: "Sources")],
    swiftLanguageVersions: [.v5]
)
