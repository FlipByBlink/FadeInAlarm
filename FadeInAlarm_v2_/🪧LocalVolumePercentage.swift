
import SwiftUI


struct 🪧LocalVolumePercentage: View {
    
    var 🪧: String
    
    var 🎨: HierarchicalShapeStyle
    
    var body: some View {
        Text(🪧)
            .font(.caption.monospacedDigit())
            .foregroundStyle(🎨)
            .frame(width: 54, height: 24, alignment: .trailing)
            .padding(.trailing, 4)
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
    
    var 🔍Percentage: String {
        let 🔍 = Int(((📱.🪧LVP🔍FadeIn - 0.4)/0.6)*100)
        if 🔍 >= 100 {
            return 100.description + " %"
        } else {
            return 🔍.description + " %"
        }
    }
    
    var body: some View {
        🪧LocalVolumePercentage(🔍Percentage, .secondary)
    }
}


struct 🪧LocalVolumePercentageFadeOut: View {
    @EnvironmentObject var 📱: 📱Model
    
    var 🄿ercentage: String {
        let 🔍 = Int(((📱.🪧LVP🔍FadeOut - 0.4)/0.6)*100)
        if 🔍 < 0 {
            return 0.description + " %"
        }
        return 🔍.description + " %"
    }
    
    var body: some View {
        🪧LocalVolumePercentage(🄿ercentage)
    }
}




struct 🪧LocalVolumePercentage_Previews: PreviewProvider {
    static var previews: some View {
        🪧LocalVolumePercentage("88 %")
    }
}
