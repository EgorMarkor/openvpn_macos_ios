import SwiftUI

@main
struct OpenVPNClientApp: App {
    @StateObject private var manager = OpenVPNManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
