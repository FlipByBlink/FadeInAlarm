import SwiftUI
import AVFAudio
import MediaPlayer

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        TabView {
            🄼ainTab()
                .tabItem { Label("Alarm", systemImage: "alarm") }
            Text("Option")
                .tabItem { Label("Option", systemImage: "gear") }
            Text("Guide")
                .tabItem { Label("Guide", systemImage: "questionmark") }
            📄DocumentButton()
                .tabItem { Label("About", systemImage: "info") }
        }
        .modifier(🗄️NowPlayingCenterSubtitleHandling())
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
            .toolbar { 📁ImportFileButtons() }
            .navigationBarTitleDisplayMode(.inline)
            .background {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea()
            }
        }
    }
}
