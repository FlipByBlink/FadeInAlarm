import SwiftUI

struct 🪧LocalVolumePercentage: View {
    private var ⓟercentLabel: Int
    private var ⓢhapeStyle: HierarchicalShapeStyle
    var body: some View {
        Text("\(self.ⓟercentLabel) %")
            .font(.caption.monospacedDigit())
            .foregroundStyle(self.ⓢhapeStyle)
            .frame(width: 54, height: 24, alignment: .trailing)
            .padding(.trailing, 4)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
    }
    init(_ percentLabel: Int, _ shapeStyle: HierarchicalShapeStyle = .tertiary) {
        self.ⓟercentLabel = percentLabel
        self.ⓢhapeStyle = shapeStyle
    }
}

struct 🪧LocalVolumePercentageFadeIn: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓟercentLabel: Int {
        let ⓒalculation = Int(((📱.🔍scaleLVPFadeIn - 0.4) / 0.6) * 100)
        return (ⓒalculation >= 100) ? 100 : ⓒalculation
    }
    var body: some View {
        🪧LocalVolumePercentage(self.ⓟercentLabel, .secondary)
    }
}

struct 🪧LocalVolumePercentageFadeOut: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓟercentLabel: Int {
        let ⓒalculation = Int(((📱.🔍scaleLVPFadeOut - 0.4) / 0.6) * 100)
        return (ⓒalculation < 0) ? 0 : ⓒalculation
    }
    var body: some View {
        🪧LocalVolumePercentage(self.ⓟercentLabel)
    }
}
