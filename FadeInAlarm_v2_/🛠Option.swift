
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
        .popover(isPresented: $🛠) {
            ZStack {
                Color.clear
                
                VStack(spacing: 16) {
                    📁ImportFile()
                    
                    
                    /* ==== Deferment "Automatic start" ====
                    Divider()
                    
                    Toggle("Automatic start", isOn: $📱.🛠AutoStart)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Divider() */
                    
                    Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                        Label("AppStore", systemImage: "link")
                            .font(.footnote)
                    }
                    
                    Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                        Label("Source code", systemImage: "link")
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: 300)
                .padding(.vertical, 16)
            }
            .overlay(alignment: .topLeading) {
                Button {
                    🛠 = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.caption)
                }
            }
            .padding()
        }
    }
}




struct 🛠Option_Previews: PreviewProvider {
    static var previews: some View {
        🛠Option()
    }
}
