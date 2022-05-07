
import SwiftUI


struct 🛠Option: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    @State private var 🛠 = false
    
    var body: some View {
        Button {
            🛠 = true
        } label: {
            Image(systemName: "gearshape")
                .font(.title)
        }
        .disabled(📱.🔛 != .PowerOff)
        .sheet(isPresented: $🛠) {
            NavigationView {
                List {
                    📁ImportFile()
                    
                    Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                        Label("AppStore", systemImage: "link")
                    }
                    
                    Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                        Label("Source code", systemImage: "link")
                    }
                }
                .navigationTitle("FadeInAlarm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            🛠 = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.caption)
                        }
                    }
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
