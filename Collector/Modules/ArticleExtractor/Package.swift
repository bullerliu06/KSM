// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "ArticleExtractor",
	platforms: [.macOS(.v14), .iOS(.v17)],
	products: [
		.library(
			name: "ArticleExtractor",
			targets: ["ArticleExtractor"]),
	],
	dependencies: [
		.package(path: "../FoundationExtras"),
		.package(path: "../Secrets")
	],
	targets: [
		.target(
			name: "ArticleExtractor",
			dependencies: [
				"FoundationExtras",
				"Secrets"
			],
			swiftSettings: []
		),
		.testTarget(
			name: "ArticleExtractorTests",
			dependencies: ["ArticleExtractor"]),
	]
)
