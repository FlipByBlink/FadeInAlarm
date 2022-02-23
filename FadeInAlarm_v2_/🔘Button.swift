
import SwiftUI


struct 🔘Button: View {
    
    enum ButtonIs: String {
        case start = "power.circle.fill"
        case stop = "checkmark.circle.fill"
    }
    
    var type: ButtonIs
    
    
    var action: () -> Void
    
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Image(systemName: type.rawValue)
        }
        .font(.system(size: 80))
        .padding(16)
        .background {
            Circle()
                .foregroundColor(Color(.systemBackground))
                .padding()
        }
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static var previews: some View {
        🔘Button(type: .start){
            print("No action.")
        }
    }
}
