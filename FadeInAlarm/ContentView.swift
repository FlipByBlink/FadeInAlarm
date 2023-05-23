import SwiftUI
import AVFAudio
import MediaPlayer

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        TabView {
            🄼ainTab()
                .tabItem { Label("Alarm", systemImage: "alarm") }
            🛠️OptionMenu()
                .tabItem { Label("Option", systemImage: "gear") }
            💁GuideTab()
                .tabItem { Label("Guide", systemImage: "questionmark") }
            🗄️AboutAppTab()
                .tabItem { Label("About", systemImage: "info") }
        }
        .modifier(🗄️NowPlayingCenterSubtitleHandling())
        .modifier(🗄️InterruptionResultHandling())
        .modifier(🗄️SystemVolumeZeroAlert())
        .modifier(🔔Notification.Handling())
        .modifier(📣ADSheet())
    }
}

private struct 🄼ainTab: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        NavigationStack {
            ScrollView {
                🗄️PhaseTitle()
                📝DiagramBoard()
                    .padding(.bottom, 150)
            }
            .overlay(alignment: .bottomTrailing) { 🎚️SystemVolumeSlider() }
            .toolbar { 📁ImportFileMenu() }
            .navigationBarTitleDisplayMode(.inline)
            .background {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea()
            }
        }
    }
}
