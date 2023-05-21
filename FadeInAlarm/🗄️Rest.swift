import SwiftUI

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

struct 🗄️NowPlayingCenterSubtitleHandling: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    func body(content: Content) -> some View {
        content
            .onChange(of: 📱.🔛phase) {
                📻NowPlayingInfoCenter.setSubtitle($0)
            }
    }
}
