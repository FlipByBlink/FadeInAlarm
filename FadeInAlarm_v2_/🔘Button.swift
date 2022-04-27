
import SwiftUI


struct 🔘Button: View {
    
    enum 🅃ype: String {
        case Start = "power.circle.fill"
        case Stop = "checkmark.circle.fill"
    }
    
    var ⓣype: 🅃ype
    
    var now: 🔛Phase = .Waiting
    
    var 🄰ction: () -> Void
    
    
    var 色: Color {
        if now == .FadeOut {
            return .gray
        }
        
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
                .foregroundStyle(Color(.systemBackground), 色)
                .shadow(radius: 4,
                        x: 1, y: 1.5)
        }
        .padding()
        .disabled(now == .FadeOut)
        .opacity(now == .FadeOut ? 0.66 : 1.0)
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static var previews: some View {
        🔘Button(ⓣype: .Start,now: .PowerOff){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        🔘Button(ⓣype: .Stop,now: .MaxVolume){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        🔘Button(ⓣype: .Stop,now: .FadeOut){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
