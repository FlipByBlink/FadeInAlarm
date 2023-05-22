import SwiftUI
import AVFAudio

struct 🗄️PhaseTitle: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Text(📱.🔛phase.title)
            .font(.largeTitle.bold())
            .padding(.leading, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .animation(.default, value: 📱.🔛phase)
    }
}

struct 🗄️InterruptionResultHandling: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    @Environment(\.scenePhase) var scenePhase
    func body(content: Content) -> some View {
        content
            .onChange(of: self.scenePhase) {
                if $0 == .active {
                    if 📱.🔛phase != .powerOff, !📱.📻player.isPlaying {
                        📱.🔛phase = .powerOff
                    }
                }
            }
    }
}

struct 🗄️SystemVolumeMuteAlert: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓟresent: Bool = false
    func body(content: Content) -> some View {
        content
            .onChange(of: 📱.🔛phase) {
                if $0 == .waiting {
                    if AVAudioSession.sharedInstance().outputVolume == 0 {
                        self.ⓟresent = true
                    }
                }
            }
            .alert("⚠️ System volume is 0.0!", isPresented: self.$ⓟresent) {
                EmptyView()
            } message: {
                Text("Increase system volume")
            }
    }
}

struct 🗄️NowPlayingCenterSubtitleHandling: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    func body(content: Content) -> some View {
        content
            .onChange(of: 📱.🔛phase) {
                📻NowPlayingInfoCenter.setSubtitle($0)
            }
    }
}
