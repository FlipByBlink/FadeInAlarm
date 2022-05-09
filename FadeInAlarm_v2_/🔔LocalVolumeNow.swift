
import SwiftUI


struct 🔔LocalVolumeNow: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Group {
            if 📱.🔛 != .PowerOff {
                ZStack {
                    VStack(spacing: 4) {
                        Image(systemName: "bell")
                            .font(.body.weight(.semibold))
                        
                        Text(📱.🔔Volume.description + "%")
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
                    
                    if 📱.📻.ⓟlayer.isPlaying == false {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .font(.title.weight(.medium))
                    }
                }
                .padding()
            }
        }
        .animation(.default, value: 📱.🔔Volume)
        .animation(.default, value: 📱.🔛)
    }
}




struct 🔔LocalVolumeNow_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    static var previews: some View {
        🔔LocalVolumeNow()
            .environmentObject(📱)
    }
}
