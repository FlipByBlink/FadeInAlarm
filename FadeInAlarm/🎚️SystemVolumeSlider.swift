import SwiftUI
import MediaPlayer

struct 🎚️SystemVolumeSlider: View {
    @Environment(\.colorScheme) var colorScheme
    private var ⓑackgroundColor: Color {
        self.colorScheme == .light ? Color(white: 0.1) : Color(uiColor: .systemBackground)
    }
    private static let ⓞffset: CGFloat = 100
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("System volume")
                .environment(\.colorScheme, .dark)
                .font(.subheadline.bold())
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .frame(maxWidth: 200, alignment: .leading)
            Self.🄼PVolumeView()
                .accessibilityHidden(true)
                .frame(width: 200, height: 40)
                .padding(.trailing, Self.ⓞffset)
        }
        .padding(.top)
        .padding(.horizontal, 24)
        .background(alignment: .leading) {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(self.ⓑackgroundColor)
                .shadow(radius: 3)
        }
        .padding(.bottom, 24)
        .offset(x: Self.ⓞffset)
    }
    private struct 🄼PVolumeView: UIViewRepresentable {
        func makeUIView(context: Context) -> MPVolumeView { .init(frame: .zero) }
        func updateUIView(_ view: MPVolumeView, context: Context) { /* Nothing to do */ }
    }
}
