import SwiftUI

@main
struct FadeInAlarmApp: App {
    @StateObject private var 📱 = 📱AppModel()
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea()
                ContentView()
            }
            .overlay(alignment: .bottomTrailing) {
                🔘MainButton() // ⏻ ✓
            }
            .overlay(alignment: .bottomLeading) {
                🔔LocalVolumeNow()
            }
            .environmentObject(📱)
        }
    }
}
