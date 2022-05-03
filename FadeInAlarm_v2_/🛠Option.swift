
import SwiftUI


struct 🛠Option: View {
    
    @State private var 🛠 = false
    
    var body: some View {
        Button {
            🛠 = true
        } label: {
            Image(systemName: "gearshape")
                .font(.headline)
        }
        .popover(isPresented: $🛠) {
            VStack(spacing: 24) {
                📁ImportFile()
                
                Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                    Label("AppStore", systemImage: "link")
                        .font(.caption)
                }
                
                Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                    Label("Source code", systemImage: "link")
                        .font(.caption)
                }
            }
            .padding(32)
        }
    }
}




struct 🛠Option_Previews: PreviewProvider {
    static var previews: some View {
        🛠Option()
    }
}
