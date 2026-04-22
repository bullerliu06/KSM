// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "Tree",
	products: [
		.library(
			name: "Tree",
			targets: ["Tree"]),
	],
	targets: [
		.target(
			name: "Tree",
			dependencies: [],
			swiftSettings: []
		),
		.testTarget(
			name: "TreeTests",
			dependencies: ["Tree"])
	]
)
