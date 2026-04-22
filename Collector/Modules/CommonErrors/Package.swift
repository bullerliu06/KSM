// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "CommonErrors",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(
			name: "CommonErrors",
			targets: ["CommonErrors"]),
	],
	dependencies: [
		.package(path: "../Web"),
	],
	targets: [
		.target(
			name: "CommonErrors",
			dependencies: [
				"Web"
			],
			swiftSettings: []
		),
		.testTarget(
			name: "CommonErrorsTests",
			dependencies: ["CommonErrors"]),
	]
)
