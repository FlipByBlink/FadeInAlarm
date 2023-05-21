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
    }
}

private struct 🄼ainTab: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    📝DiagramBoard()
                    📁ImportFileSection()
                }
            }
            .frame(maxWidth: .infinity)
            .animation(.default, value: 📱.🔛phase)
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                🎚️SystemVolumeSlider()
            }
            .toolbar { 🗄️PhaseTitle() }
            .navigationBarTitleDisplayMode(.inline)
            .background {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea()
            }
        }
    }
}
