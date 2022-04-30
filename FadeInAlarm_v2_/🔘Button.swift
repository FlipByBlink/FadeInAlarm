
import SwiftUI


struct 🔘Button: View {
    
//    var 🔛: 🔛Phase
    
    @EnvironmentObject var 📱: 📱Model
    
    var 🄰ction: () -> Void
    
    var 🎨: Color {
        switch 📱.🔛 {
        case .Waiting: return .red
        case .FadeIn: return .red
        case .MaxVolume: return .red
        case .FadeOut: return .gray
        case .PowerOff: return .accentColor
        }
    }
    
    var 🖼Name: String {
        📱.🔛 == .PowerOff ? "power.circle.fill" : "checkmark.circle.fill"
    }
    
    var body: some View {
        Button {
            🄰ction()
        } label: {
            Image(systemName: 🖼Name)
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(.systemBackground), 🎨)
                .shadow(radius: 4,
                        x: 1, y: 1.5)
        }
        .padding()
        .disabled(📱.🔛 == .FadeOut)
        .opacity(📱.🔛 == .FadeOut ? 0.6 : 1.0)
        .accessibilityLabel(📱.🔛 == .PowerOff ? "Set alarm" : "Stop alarm")
    }
    
    init(/*_ 🔛: 🔛Phase = .Waiting,*/_ 🄰ction: @escaping () -> Void) {
//        self.🔛 = 🔛
        self.🄰ction = 🄰ction
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static let 📱p:📱Model = {
        let a = 📱Model()
        a.🔛 = .PowerOff
        return a
    }()
    
    static let 📱m:📱Model = {
        let a = 📱Model()
        a.🔛 = .MaxVolume
        return a
    }()
    
    static let 📱f:📱Model = {
        let a = 📱Model()
        a.🔛 = .FadeOut
        return a
    }()
    
    static var previews: some View {
        VStack {
            🔘Button(){ }
                .environmentObject(📱p)
            
            🔘Button(){ }
                .environmentObject(📱m)
            
            🔘Button(){ }
                .environmentObject(📱f)
        }
        .previewLayout(.fixed(width: 300, height: 500))
        
        VStack {
            🔘Button(){ }
                .environmentObject(📱p)
            
            🔘Button(){ }
                .environmentObject(📱m)
            
            🔘Button(){ }
                .environmentObject(📱f)
        }
        .previewLayout(.fixed(width: 300, height: 500))
        .preferredColorScheme(.dark)
    }
}
