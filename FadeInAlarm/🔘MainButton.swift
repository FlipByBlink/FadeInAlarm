import SwiftUI
import MediaPlayer

struct 🔘MainButton: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓒolor: Color {
        switch 📱.🔛phase {
            case .waiting, .fadeIn, .maxVolume: return .red
            case .fadeOut: return .gray
            case .powerOff: return .accentColor
        }
    }
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
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(uiColor: .systemBackground), self.ⓒolor)
                .shadow(radius: 4, x: -2, y: 2)
        }
        .padding()
        .disabled(📱.🔛phase == .fadeOut)
        .opacity(📱.🔛phase == .fadeOut ? 0.6 : 1.0)
        .accessibilityLabel(📱.🔛phase == .powerOff ? "Set alarm" : "Stop alarm")
        .animation(.default, value: 📱.🔛phase)
    }
}
