
import SwiftUI


enum 🔛Phase {
    
    case Waiting
    case FadeIn
    case MaxVolume
    case FadeOut
    case PowerOff
    
    
    struct ⓐrrow: View {
        var body: some View {
            Image(systemName: "arrow.left")
                .font(.largeTitle.weight(.thin))
                .foregroundColor(.secondary)
                .padding()
        }
    }
}
