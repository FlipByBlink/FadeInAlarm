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
