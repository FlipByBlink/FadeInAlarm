
import SwiftUI


struct 🪧LocalVolumePercentage: View {
    
    var 🪧: String
    
    var body: some View {
        Text(🪧)
            .font(.caption)
            .foregroundStyle(.tertiary)
            .frame(width: 50)
            .minimumScaleFactor(0.1)
    }
    
    init(_ 🪧: String) {
        self.🪧 = 🪧
    }
}



struct 🪧LocalVolumePercentage_Previews: PreviewProvider {
    static var previews: some View {
        🪧LocalVolumePercentage("88%")
    }
}
