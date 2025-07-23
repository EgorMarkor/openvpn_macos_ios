// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "OpenVPNClient",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .executable(name: "OpenVPNClient", targets: ["OpenVPNClient"])
    ],
    targets: [
        .executableTarget(
            name: "OpenVPNClient",
            path: "OpenVPNClient"
        )
    ]
)
