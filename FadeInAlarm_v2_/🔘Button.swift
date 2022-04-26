
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
        }
        .font(.system(size: 96))
        .padding()
        .background {
            Circle()
                .foregroundColor(Color(.systemBackground))
                .padding()
        }
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static var previews: some View {
        🔘Button(ⓣype: .Start){
            print("No action.")
        }
        
        🔘Button(ⓣype: .Stop){
            print("No action.")
        }
    }
}
