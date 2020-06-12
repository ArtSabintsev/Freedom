// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Freedom",
    products: [.library(name: "Freedom", targets: ["Freedom"])],
    targets: [.target(name: "Freedom", path: "Sources")],
    platforms: [.iOS(.v9)],  
    swiftLanguageVersions: [.v5]
)
