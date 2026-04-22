// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "Web",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(
			name: "Web",
			type: .dynamic,
			targets: ["Web"]),
	],
	targets: [
		.target(
			name: "Web",
			dependencies: [],
			swiftSettings: [
				.define("SWIFT_PACKAGE")
			]
		),
		.testTarget(
			name: "WebTests",
			dependencies: ["Web"]),
	]
)
