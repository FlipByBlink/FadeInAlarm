
import SwiftUI

//popoverではなく他も検討
//VStackではなくListを検討

struct 🛠Option: View {
    
    @State private var 🛠 = false
    
    @AppStorage("自動スタート") var 自動スタート = false
    
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
                
                //TODO: 実装
                Toggle("自動スタート", isOn: $自動スタート)
                
                Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                    Label("AppStore", systemImage: "link")
                }
                
                Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                    Label("Source code", systemImage: "link")
                }
                
                //FIXME: iphone横向きでpopover向け実装
                Button("×") {
                    🛠 = false
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
