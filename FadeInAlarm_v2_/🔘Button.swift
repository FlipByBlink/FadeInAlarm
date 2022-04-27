
import SwiftUI


struct 🔘Button: View {
    
    enum 🅃ype: String {
        case Start = "power.circle.fill"
        case Stop = "checkmark.circle.fill"
    }
    
    var ⓣype: 🅃ype
    
    var ⓝow: 🔛Phase = .Waiting
    
    var 🄰ction: () -> Void
    
    var 🎨: Color {
        if ⓝow == .FadeOut { return .gray }
        
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
        .disabled(ⓝow == .FadeOut)
        .opacity(ⓝow == .FadeOut ? 0.6 : 1.0)
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static var previews: some View {
        🔘Button(ⓣype: .Start, ⓝow: .PowerOff){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        🔘Button(ⓣype: .Stop, ⓝow: .MaxVolume){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        🔘Button(ⓣype: .Stop, ⓝow: .FadeOut){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
