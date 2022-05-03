
import SwiftUI


struct 🔊LocalVolumeNow: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        if 📱.🔛 != .PowerOff {
            ZStack {
                Label( 📱.🔔Volume.description + "%" , systemImage: "bell")
                    .opacity(0.9)
                    .foregroundColor(.secondary)
                    .padding()
                
                TimelineView(.periodic(from: .now, by: 1)) { _ in
                    if 📱.📻.ⓟlayer.isPlaying == false {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.secondary)
                            .opacity(0.7)
                    }
                }
            }
            .padding()
        } else {
            EmptyView()
        }
    }
}




struct 🔊LocalVolumeNow_Previews: PreviewProvider {
    
    static let 📱 = 📱Model()
    
    static var previews: some View {
        🔊LocalVolumeNow()
            .environmentObject(📱)
    }
}
