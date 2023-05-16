import SwiftUI
import AVFAudio
import MediaPlayer

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            ScrollView {
                📝DiagramBoard()
                HStack {
                    Spacer()
                    VStack(spacing: 36) {
                        🔊SystemVolumeSlider()
                        📁ImportFileSection()
                        📄DocumentButton()
                    }
                    .padding()
                    .padding(.bottom, 140)
                    Spacer()
                }
            }
            .animation(.default, value: 📱.🔛phase)
        }
        .overlay(alignment: .bottomTrailing) { 🔘MainButton() } // ⏻ ✓
        .overlay(alignment: .bottomLeading) { 🔔LocalVolumeNow() }
    }
}
