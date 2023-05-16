import SwiftUI
import MediaPlayer

struct 🔊SystemVolumeSlider: View {
    var body: some View {
        Self.🄼PVolumeView()
            .contrast(0)
            .frame(width: 160, height: 20)
            .accessibilityHidden(true)
    }
    private struct 🄼PVolumeView: UIViewRepresentable {
        func makeUIView(context: Context) -> MPVolumeView { .init(frame: .zero) }
        func updateUIView(_ view: MPVolumeView, context: Context) { /* Nothing to do */ }
    }
}
