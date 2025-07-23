import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: OpenVPNManager
    @State private var rotate = false

    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Received: \(manager.receivedDataString)")
                Text("Sent: \(manager.sentDataString)")
            }
            Button(action: {
                manager.toggleConnection()
            }) {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                    Text(manager.buttonTitle)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .rotationEffect(.degrees(manager.isConnecting ? 360 : 0))
                .animation(manager.isConnecting ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default, value: manager.isConnecting)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView().environmentObject(OpenVPNManager())
}
