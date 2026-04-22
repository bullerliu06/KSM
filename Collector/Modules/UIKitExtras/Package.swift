// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "UIKitExtras",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(
			name: "UIKitExtras",
			targets: ["UIKitExtras"]),
	],
	targets: [
		.target(
			name: "UIKitExtras",
			swiftSettings: []
		),
		.testTarget(
			name: "UIKitExtrasTests",
			dependencies: ["UIKitExtras"]),
	]
)
