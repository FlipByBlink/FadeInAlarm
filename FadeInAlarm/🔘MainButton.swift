import SwiftUI
import MediaPlayer

struct 🔘MainButton: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Button {
            switch 📱.🔛phase {
                case .powerOff: 📱.startAlarm()
                case .waiting: 📱.🔛phase = .powerOff
                case .fadeIn, .maxVolume: 📱.🔛phase = .fadeOut
                case .fadeOut: break
            }
        } label: {
            Image(systemName: 📱.🔛phase == .powerOff ? "power.circle.fill" : "checkmark.circle.fill")
                .font(.title.weight(.medium))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(uiColor: .systemBackground), self.ⓒolor)
                .shadow(radius: 2)
        }
        .disabled(📱.🔛phase == .fadeOut)
        .opacity(📱.🔛phase == .fadeOut ? 0.6 : 1.0)
        .accessibilityLabel(📱.🔛phase == .powerOff ? "Set alarm" : "Stop alarm")
        .animation(.default, value: 📱.🔛phase)
    }
    private var ⓒolor: Color {
        switch 📱.🔛phase {
            case .waiting, .fadeIn, .maxVolume: return .red
            case .fadeOut: return .gray
            case .powerOff: return .accentColor
        }
    }
}
