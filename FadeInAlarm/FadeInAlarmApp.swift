import SwiftUI

@main
struct FadeInAlarmApp: App {
    @StateObject private var 📱 = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                ContentView()
            }
            .overlay(alignment: .bottomTrailing) {
                🔘Button() // ⏻ ✓
            }
            .overlay(alignment: .bottomLeading) {
                🔔LocalVolumeNow()
            }
            .environmentObject(📱)
        }
    }
}
