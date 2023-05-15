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
                        Text("\(📱.🔔volume.description)%")
                            .font(.caption.weight(.semibold))
                            .monospacedDigit()
                    }
                    .opacity(0.9)
                    .foregroundColor(.secondary)
                    .padding()
                    .background {
                        Circle()
                            .foregroundColor(Color(.secondarySystemBackground))
                            .opacity(0.8)
                    }
                    if 📱.📻alarm.ⓟlayer.isPlaying == false {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .font(.title.weight(.medium))
                    }
                }
                .padding()
            }
        }
        .animation(.default, value: 📱.🔔volume)
        .animation(.default, value: 📱.🔛phase)
    }
}
