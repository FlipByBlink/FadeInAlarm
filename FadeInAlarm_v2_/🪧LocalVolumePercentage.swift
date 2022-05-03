
import SwiftUI


struct 🪧LocalVolumePercentage: View {
    
    var 🪧: String
    
    var 🎨: HierarchicalShapeStyle
    
    var body: some View {
        Text(🪧)
            .font(.caption)
            .foregroundStyle(🎨)
            .frame(width: 60, height: 24)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
    }
    
    init(_ 🪧: String, _ 🎨: HierarchicalShapeStyle = .tertiary) {
        self.🪧 = 🪧
        self.🎨 = 🎨
    }
}


struct 🪧LocalVolumePercentageFadeIn: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var 🪧: String {
        String(Int(((📱.🪧LVP🔍FadeIn - 0.4)/0.6)*100)) + "%"
    }
    
    var body: some View {
        🪧LocalVolumePercentage(🪧, .secondary)
    }
}


struct 🪧LocalVolumePercentageFadeOut: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var 🪧: String {
        String(Int(((📱.🪧LVP🔍FadeOut - 0.4)/0.6)*100)) + "%"
    }
    
    var body: some View {
        🪧LocalVolumePercentage(🪧)
    }
}




struct 🪧LocalVolumePercentage_Previews: PreviewProvider {
    static var previews: some View {
        🪧LocalVolumePercentage("88%")
    }
}
