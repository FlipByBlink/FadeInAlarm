
import SwiftUI


struct 🔔: View {
    
    var phase: 🔛Phase
    
    var isSlash: Bool = false
    
    
    var body: some View {
        
        Image(systemName: isSlash ? "bell.slash" : "bell")
            .font(🄵ont)
            .symbolVariant(isSlash ? .slash : .none)
            .padding(2)
    }
    
    
    var 🄵ont: Font {
        get {
            switch phase {
            case .waiting:
                return .footnote
            case .fadeIn:
                return .title
            case .maxVolume:
                return .largeTitle
            case .fadeOut:
                return .footnote
            case .powerOff:
                return .body
            }
        }
    }
}




struct 🔔View_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            🔔(phase: .waiting,isSlash: true)
            🔔(phase: .waiting)
            🔔(phase: .fadeIn)
            🔔(phase: .maxVolume)
            🔔(phase: .fadeOut)
        }
    }
}
