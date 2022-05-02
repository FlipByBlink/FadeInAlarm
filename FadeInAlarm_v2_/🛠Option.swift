
import SwiftUI


struct 🛠Option: View {
    
    @State private var 🛠 = false
    
    var body: some View {
        Button {
            🛠 = true
        } label: {
            Image(systemName: "gearshape")
                .font(.title)
        }
        .popover(isPresented: $🛠) {
            VStack {
                📁ImportFile()
                
                🔗Link()
            }
        }
    }
}




struct 🛠Option_Previews: PreviewProvider {
    static var previews: some View {
        🛠Option()
    }
}
