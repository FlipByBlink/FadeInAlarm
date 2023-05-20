import SwiftUI
import MediaPlayer

class 📱AppModel: ObservableObject {
    
    let 📻player = 📻AlarmPlayer()
    
    @AppStorage("VolumeOnWaiting") var 🔊volumeOnWaiting: Int = 3
    @Published var 🕰timeFadeIn: Date = Calendar.current.startOfDay(for: .now)
    @AppStorage("HourFadein") var 🕛hourFadein: Double = 10.0
    @AppStorage("HourFadeOut") var 🕛hourFadeOut: Double = 3.0
    
    @Published var 🔛phase: 🔛Phase = .powerOff
    @Published var 🔔localVolume: Int = 0
}

extension 📱AppModel {
    func startAlarm() {
        self.🔛phase = .waiting
        self.📻player.play(self.🕰timeFadeIn, self.🕛hourFadein)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { ⓣimer in
            switch self.🔛phase {
                case .waiting:
                    self.📻player.volume = Float(self.🔊volumeOnWaiting) / 100
                    let ⓗourAndMinute = Calendar.current.dateComponents([.hour, .minute], from: .now)
                    if Calendar.current.date(self.🕰timeFadeIn, matchesComponents: ⓗourAndMinute) {
                        self.🔛phase = .fadeIn
                    }
                case .fadeIn:
                    self.📻player.volume += Float(0.5 / self.🕛hourFadein)
                    if self.📻player.volume > 1.0 {
                        self.📻player.volume = 1.0
                        self.🔛phase = .maxVolume
                    }
                case .maxVolume:
                    break
                case .fadeOut:
                    self.📻player.volume -= Float(0.5 / self.🕛hourFadeOut)
                    if self.📻player.volume < 0.0 {
                        self.📻player.volume = 0.0
                        self.🔛phase = .powerOff
                    }
                case .powerOff:
                    self.📻player.stop()
                    MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                    ⓣimer.invalidate()
            }
            self.🔔localVolume = Int(self.📻player.volume * 100)
        }
        MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
            self.🔛phase = .fadeOut
            return .success
        }
    }
}
