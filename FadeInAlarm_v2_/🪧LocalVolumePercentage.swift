
import SwiftUI


struct 🪧LocalVolumePercentage: View {
    
    var 🪧: String
    
    var 🎨: HierarchicalShapeStyle
    
    var body: some View {
        Text(🪧)
            .font(.caption)
            .foregroundStyle(🎨)
            .frame(width: 50)
            .minimumScaleFactor(0.1)
    }
    
    init(_ 🪧: String, _ 🎨: HierarchicalShapeStyle = .tertiary) {
        self.🪧 = 🪧
        self.🎨 = 🎨
    }
}



struct 🪧LocalVolumePercentage_Previews: PreviewProvider {
    static var previews: some View {
        🪧LocalVolumePercentage("88%")
    }
}
