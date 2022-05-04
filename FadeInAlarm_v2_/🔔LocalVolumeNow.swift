
import SwiftUI


struct 🔔LocalVolumeNow: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Group {
            if 📱.🔛 != .PowerOff {
                ZStack {
                    VStack(spacing: 4) {
                        Image(systemName: "bell")
                        
                        Text(📱.🔔Volume.description + "%")
                            .font(.caption)
                    }
                    .opacity(0.9)
                    .foregroundColor(.secondary)
                    .padding()
                    
                    if 📱.📻.ⓟlayer.isPlaying == false {
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .font(.title.weight(.medium))
                    }
                }
                .padding()
            }
        }
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
