// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "AppKitExtras",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(
			name: "AppKitExtras",
			type: .dynamic,
			targets: ["AppKitExtras"]),
	],
	dependencies: [
		.package(path: "../FoundationExtras")
	],
	targets: [
		.target(
			name: "AppKitExtras",
			dependencies: [
				"FoundationExtras",
			],
			swiftSettings: []
		),
		.testTarget(
			name: "AppKitExtrasTests",
			dependencies: ["AppKitExtras"]),
	]
)
