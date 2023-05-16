import SwiftUI

struct 🔔LocalVolumeNow: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Group {
            if 📱.🔛phase != .powerOff {
                ZStack {
                    VStack(spacing: 4) {
                        Image(systemName: "bell")
                            .font(.body.weight(.semibold))
                        Text("\(📱.🔔localVolume)%")
                            .font(.caption.weight(.semibold))
                            .monospacedDigit()
                    }
                    .opacity(0.9)
                    .foregroundColor(.secondary)
                    .padding()
                    .background {
                        Circle()
                            .foregroundColor(Color(uiColor: .secondarySystemBackground))
                            .opacity(0.8)
                    }
                    if 📱.📻player.isPlaying == false {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .font(.title.weight(.medium))
                    }
                }
                .padding()
            }
        }
        .animation(.default, value: 📱.🔔localVolume)
        .animation(.default, value: 📱.🔛phase)
    }
}
