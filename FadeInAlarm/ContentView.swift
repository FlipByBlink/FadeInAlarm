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
                VStack(spacing: 16) {
                    📝DiagramBoard()
                    📁ImportFileSection()
                }
            }
            .frame(maxWidth: .infinity)
            .animation(.default, value: 📱.🔛phase)
            .overlay(alignment: .bottomLeading) { 🔔LocalVolumeNow() }
            .safeAreaInset(edge: .bottom, alignment: .trailing) { 🔊SystemVolumeSlider() }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(📱.🔛phase.title)
                        .fontWeight(.semibold)
                        .animation(.default, value: 📱.🔛phase)
                }
                ToolbarItem(placement: .navigationBarTrailing) { 🔘MainButton() }
            }
            .background {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea()
            }
        }
    }
}
