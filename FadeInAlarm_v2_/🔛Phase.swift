
import SwiftUI


enum 🔛Phase {
    
    case waiting
    case fadeIn
    case maxVolume
    case fadeOut
    case powerOff
    
    
    struct arrow: View {
        
        var body: some View {
            
            Image(systemName: "arrow.left")
                .font(.largeTitle.weight(.thin))
                .foregroundColor(.secondary)
                .padding()
        }
    }
}
