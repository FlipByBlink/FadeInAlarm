
import SwiftUI


struct 🪧LocalVolumePercentage: View {
    var 🪧: Int
    
    var 🎨: HierarchicalShapeStyle
    
    var body: some View {
        Text(🪧.description + " %")
            .font(.caption.monospacedDigit())
            .foregroundStyle(🎨)
            .frame(width: 54, height: 24, alignment: .trailing)
            .padding(.trailing, 4)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
    }
    
    init(_ 🪧: Int, _ 🎨: HierarchicalShapeStyle = .tertiary) {
        self.🪧 = 🪧
        self.🎨 = 🎨
    }
}


struct 🪧LocalVolumePercentageFadeIn: View {
    @EnvironmentObject var 📱: 📱Model
    
    var 📈: Int {
        let 🔍 = Int(((📱.🪧LVP🔍FadeIn - 0.4)/0.6)*100)
        if 🔍 >= 100 {
            return 100
        } else {
            return 🔍
        }
    }
    
    var body: some View {
        🪧LocalVolumePercentage(📈, .secondary)
    }
}


struct 🪧LocalVolumePercentageFadeOut: View {
    @EnvironmentObject var 📱: 📱Model
    
    var 📉: Int {
        let 🔍 = Int(((📱.🪧LVP🔍FadeOut - 0.4)/0.6)*100)
        if 🔍 < 0 {
            return 0
        }
        return 🔍
    }
    
    var body: some View {
        🪧LocalVolumePercentage(📉)
    }
}








struct 🪧LocalVolumePercentage_Previews: PreviewProvider {
    static var previews: some View {
        🪧LocalVolumePercentage(88)
    }
}
