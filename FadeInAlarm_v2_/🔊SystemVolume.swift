
import SwiftUI
import MediaPlayer


struct 🔊SystemVolume: View {
    
    var body: some View {
        
        VolumeSlider()
            .grayscale(1.0)
            .contrast(0.6)
            .frame(width: 150, height: 30)
            .padding()
    }
}


struct VolumeSlider: UIViewRepresentable {
    
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
