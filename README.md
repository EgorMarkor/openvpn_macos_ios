# OpenVPN Client for iOS and macOS

This repository contains a minimal SwiftUI based client intended to work with an OpenVPN configuration on both iOS and macOS.

## Features

- Single window interface with a large circular **Connect** button.
- Displays received and sent traffic counters.
- Shows a rotating animation while the VPN connection is being established.

The actual VPN connection logic is represented by placeholders in `OpenVPNManager.swift`. Integrating with a real OpenVPN library or NetworkExtension provider is required for a production-ready build.

## Building

Use Xcode 15 or later to open the package and run the app on iOS or macOS. The project is defined using Swift Package Manager in `Package.swift`.

```bash
swift build
```

Running the above command on non-Apple platforms will fail because SwiftUI and NetworkExtension are not available.
