
import SwiftUI


struct 🔘Button: View {
    
    enum 🅃ype: String {
        case Start = "power.circle.fill"
        case Stop = "checkmark.circle.fill"
    }
    
    var ⓣype: 🅃ype
    
    var 🄰ction: () -> Void
    
    
    var body: some View {
        Button {
            🄰ction()
        } label: {
            Image(systemName: ⓣype.rawValue)
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .primary)
                .shadow(color: .secondary,
                        radius: 5,
                        x: 1, y: 1.5)
        }
        .padding()
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static var previews: some View {
        🔘Button(ⓣype: .Start){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
        
        🔘Button(ⓣype: .Stop){
            print("No action.")
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
