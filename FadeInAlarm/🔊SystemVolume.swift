import SwiftUI
import MediaPlayer

struct 🔊SystemVolume: View {
    var body: some View {
        🎚VolumeSlider()
            .contrast(0)
            .frame(width: 160, height: 20)
            .accessibilityHidden(true)
    }
}

private struct 🎚VolumeSlider: UIViewRepresentable {
    func makeUIView(context: Context) -> MPVolumeView { .init(frame: .zero) }
    func updateUIView(_ view: MPVolumeView, context: Context) { /* Nothing to do */ }
}
