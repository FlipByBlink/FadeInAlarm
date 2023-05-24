import SwiftUI

struct 🛠️OptionMenu: View {
    var body: some View {
        NavigationStack {
            List {
                🄱ackUpAlertOption()
                📣AdImpMenuLink()
            }
            .navigationTitle("Option")
        }
    }
}

private struct 🄱ackUpAlertOption: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @AppStorage("BackUpNotification") private var ⓥalue: Bool = false
    @Environment(\.scenePhase) var scenePhase
    @State private var ⓐuthDenied: Bool = false
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 8) {
                Toggle(isOn: self.$ⓥalue) {
                    Label("System notification at max volume as back-up", systemImage: "bell.and.waves.left.and.right")
                }
                .disabled(📱.🔛phase != .powerOff)
                if self.ⓐuthDenied {
                    Label("Notification authorization is denied", systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.red)
                        .font(.caption.weight(.light))
                }
            }
        } header: {
            Text("Back up notifications")
        } footer: {
            Text("Display system notifications every 10 seconds for 5 minutes at max volume.")
            + Text("\n")
            + Text("Back-up notifications will be displayed even if this app is not running in the background.")
        }
        .task { self.ⓒheckAuth() }
        .onChange(of: self.scenePhase) {
            if $0 == .active { self.ⓒheckAuth() }
        }
    }
    private func ⓒheckAuth() {
        Task { self.ⓐuthDenied = await 🔔Notification.checkAuthDenied() }
    }
}
