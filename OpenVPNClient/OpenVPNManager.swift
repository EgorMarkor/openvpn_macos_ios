import Foundation
import Combine

final class OpenVPNManager: ObservableObject {
    @Published private(set) var receivedData: UInt64 = 0
    @Published private(set) var sentData: UInt64 = 0
    @Published private(set) var status: Status = .disconnected

    enum Status {
        case disconnected
        case connecting
        case connected
    }

    var isConnecting: Bool { status == .connecting }

    var buttonTitle: String {
        switch status {
        case .connected: return "Disconnect"
        case .connecting: return "Connecting..."
        case .disconnected: return "Connect"
        }
    }

    var receivedDataString: String { formatBytes(receivedData) }
    var sentDataString: String { formatBytes(sentData) }

    func toggleConnection() {
        switch status {
        case .disconnected:
            connect()
        case .connected:
            disconnect()
        case .connecting:
            break
        }
    }

    func connect() {
        status = .connecting
        // TODO: integrate with OpenVPN library or NetworkExtension
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.status = .connected
            // Start updating network stats from the VPN library
        }
    }

    func disconnect() {
        // TODO: stop VPN connection
        status = .disconnected
    }

    private func formatBytes(_ bytes: UInt64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useMB, .useGB]
        formatter.countStyle = .decimal
        return formatter.string(fromByteCount: Int64(bytes))
    }
}
