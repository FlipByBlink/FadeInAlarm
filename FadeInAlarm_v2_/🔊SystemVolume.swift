
import SwiftUI
import MediaPlayer


struct 🔊SystemVolume: View {
    var body: some View {
        🎚VolumeSlider()
            .contrast(0)
            .frame(width: 160, height: 36)
    }
}


struct 🎚VolumeSlider: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MPVolumeView {
        MPVolumeView(frame: .zero)
    }
    
    func updateUIView(_ view: MPVolumeView, context: Context) {}
}




struct 🔊SystemVolume_Previews: PreviewProvider {
    static var previews: some View {
        🔊SystemVolume()
    }
}
