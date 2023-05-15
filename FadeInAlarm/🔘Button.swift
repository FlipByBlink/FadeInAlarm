import SwiftUI
import MediaPlayer

struct 🔘Button: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var 🎨color: Color {
        switch 📱.🔛phase {
            case .waiting, .fadeIn, .maxVolume: return .red
            case .fadeOut: return .gray
            case .powerOff: return .accentColor
        }
    }
    var body: some View {
        Button(action: self.ⓐction) {
            Image(systemName: 📱.🔛phase == .powerOff ? "power.circle.fill" : "checkmark.circle.fill")
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(.systemBackground), self.🎨color)
                .shadow(radius: 4, x: -2, y: 2)
        }
        .padding()
        .disabled(📱.🔛phase == .fadeOut)
        .opacity(📱.🔛phase == .fadeOut ? 0.6 : 1.0)
        .accessibilityLabel(📱.🔛phase == .powerOff ? "Set alarm" : "Stop alarm")
        .animation(.default, value: 📱.🔛phase)
    }
    private func ⓐction() {
        if 📱.🔛phase == .powerOff { // ⏻
            📱.🔛phase = .waiting
            📱.📻alarm.ⓟlay(📱.🕰timeFadeIn, 📱.🕛hourFadein)
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { ⓣimer in
                switch 📱.🔛phase {
                    case .waiting:
                        📱.📻alarm.ⓟlayer.volume = Float(📱.🔊volumeOnWaiting) / 100
                        let ⓝow = Date.now.formatted(date: .omitted, time: .shortened)
                        let ⓐlarmTime = 📱.🕰timeFadeIn.formatted(date: .omitted, time: .shortened)
                        if ⓝow == ⓐlarmTime { 📱.🔛phase = .fadeIn }
                    case .fadeIn:
                        📱.📻alarm.ⓟlayer.volume += Float(0.5 / 📱.🕛hourFadein)
                        if 📱.📻alarm.ⓟlayer.volume > 1.0 {
                            📱.📻alarm.ⓟlayer.volume = 1.0
                            📱.🔛phase = .maxVolume
                        }
                    case .maxVolume:
                        break
                    case .fadeOut:
                        📱.📻alarm.ⓟlayer.volume -= Float(0.5 / 📱.🕛hourFadeOut)
                        if 📱.📻alarm.ⓟlayer.volume < 0.0 {
                            📱.📻alarm.ⓟlayer.volume = 0.0
                            📱.🔛phase = .powerOff
                        }
                    case .powerOff:
                        📱.📻alarm.ⓟlayer.stop()
                        MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                        ⓣimer.invalidate()
                }
                📱.🔔volume = Int(📱.📻alarm.ⓟlayer.volume * 100)
            }
            MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                📱.🔛phase = .fadeOut
                return .success
            }
        } else { // ✓
            if 📱.🔛phase == .waiting {
                📱.🔛phase = .powerOff
            } else {
                📱.🔛phase = .fadeOut
            }
        }
    }
}
