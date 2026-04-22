// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "Core",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(name: "Core",
				 type: .dynamic,
				 targets: ["Core"]),
		.library(name: "CoreResources",
				 type: .static,
				 targets: ["CoreResources"])
	],
	dependencies: [
		.package(path: "../AppKitExtras")
	],
	targets: [
		.target(
			name: "Core",
			dependencies: [
				"AppKitExtras",
			],
			swiftSettings: []
		),
		.target(
			name: "CoreResources",
			resources: [
				.process("Resources/WebViewWindow.xib"),
				.process("Resources/IndeterminateProgressWindow.xib")
			]),
		.testTarget(
			name: "CoreTests",
			dependencies: ["Core"]),
	]
)
