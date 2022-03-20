
import SwiftUI


struct 🔘Button: View {
    
    enum 🄱uttonIs: String {
        case start = "power.circle.fill"
        case stop = "checkmark.circle.fill"
    }
    
    var ⓣype: 🄱uttonIs
    
    
    var 🄰ction: () -> Void
    
    
    var body: some View {
        
        Button {
            🄰ction()
        } label: {
            Image(systemName: ⓣype.rawValue)
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
        🔘Button(ⓣype: .start){
            print("No action.")
        }
    }
}
