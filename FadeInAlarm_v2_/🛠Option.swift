
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
            VStack(spacing: 16) {
                📁ImportFile()
                
                Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                    Label("AppStore link", systemImage: "link")
                }
                
                Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                    Label("Source code link", systemImage: "link")
                }
            }
        }
    }
}




struct 🛠Option_Previews: PreviewProvider {
    static var previews: some View {
        🛠Option()
    }
}
