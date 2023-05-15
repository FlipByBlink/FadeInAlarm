import SwiftUI
import AVFAudio
import MediaPlayer

struct ContentView: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    🪧LocalVolumePercentage(0)
                    Image(systemName: "power.circle") // ⏻
                        .foregroundColor(.secondary)
                        .scaleEffect(1.2)
                        .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
                        .accessibilityHidden(true)
                    if 📱.🔛phase == .powerOff {
                        Image(systemName: "arrow.left") // ←
                            .foregroundStyle(.secondary)
                            .padding(.leading, 4)
                    }
                }
                HStack {
                    👆VolumeOnWaiting()
                    🔔IconWaiting()
                    if 📱.🔛phase == .waiting {
                        Image(systemName: "arrow.left") // ←
                    }
                }
                HStack {
                    🪧LocalVolumePercentage(📱.🔊volumeOnWaiting)
                    👆TimeFadeIn()
                }
                HStack {
                    🪧LocalVolumePercentageFadeIn()
                    🔔IconFadeIn()
                    👆HourFadeIn()
                    if 📱.🔛phase == .fadeIn {
                        Image(systemName: "arrow.left") // ←
                    }
                }
                HStack {
                    🪧LocalVolumePercentage(100)
                    Text(📱.🕰timeFadeIn.addingTimeInterval(📱.🕛hourFadein), style: .time)
                        .foregroundColor(.secondary)
                        .font(.footnote.weight(.medium))
                }
                HStack {
                    🪧LocalVolumePercentage(100)
                    🔔IconMaxVolume()
                    Image(systemName: "repeat")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.tertiary)
                    if 📱.🔛phase == .maxVolume {
                        Image(systemName: "arrow.left") // ←
                    }
                }
                Divider ()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                HStack {
                    🪧LocalVolumePercentage(100)
                    Image(systemName: "checkmark.circle") // ✓
                        .foregroundColor(.secondary)
                        .scaleEffect(1.2)
                }
                HStack {
                    🪧LocalVolumePercentageFadeOut()
                    🔔IconFadeOut()
                    👆HourFadeOut()
                    if 📱.🔛phase == .fadeOut {
                        Image(systemName: "arrow.left") // ←
                    }
                }
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 10)
            .background {
                RoundedRectangle(cornerRadius: 32, style: .continuous)
                    .foregroundColor(Color(.systemBackground))
                    .shadow(radius: 6, x: -2, y: 2)
            }
            .padding(32)
            .frame(maxWidth: 460)
            HStack {
                Spacer()
                VStack(spacing: 36) {
                    🔊SystemVolume()
                    📁ImportFile()
                    📄DocumentButton()
                }
                .padding()
                .padding(.bottom, 140)
                Spacer()
            }
        }
        .animation(.default, value: 📱.🔛phase)
    }
}
