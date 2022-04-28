
import SwiftUI


struct 🔘Button: View {
    
    enum 🅃ype: String {
        case Start = "power.circle.fill"
        case Stop = "checkmark.circle.fill"
    }
    
    var ⓣype: 🅃ype
    
    var 🔛: 🔛Phase
    
    var 🄰ction: () -> Void
    
    var 🎨: Color {
        if 🔛 == .FadeOut { return .gray }
        
        switch ⓣype {
        case .Start:
            return .accentColor
        case .Stop:
            return .red
        }
    }
    
    var body: some View {
        Button {
            🄰ction()
        } label: {
            Image(systemName: ⓣype.rawValue)
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(.systemBackground), 🎨)
                .shadow(radius: 4,
                        x: 1, y: 1.5)
        }
        .padding()
        .disabled(🔛 == .FadeOut)
        .opacity(🔛 == .FadeOut ? 0.6 : 1.0)
    }
    
    init(_ type: 🅃ype,_ now: 🔛Phase = .Waiting, _ action: @escaping () -> Void) {
        ⓣype = type
        🔛 = now
        🄰ction = action
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            🔘Button(.Start, .PowerOff){ }
            
            🔘Button(.Stop, .MaxVolume){ }
            
            🔘Button(.Stop, .FadeOut){ }
        }
        .previewLayout(.fixed(width: 300, height: 500))
        
        VStack {
            🔘Button(.Start, .PowerOff){ }
            
            🔘Button(.Stop, .MaxVolume){ }
            
            🔘Button(.Stop, .FadeOut){ }
        }
        .previewLayout(.fixed(width: 300, height: 500))
        .preferredColorScheme(.dark)
    }
}
