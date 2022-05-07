
import SwiftUI


struct 🛠OptionButton: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Button {
            📱.🛠 = true
        } label: {
            Image(systemName: "gearshape")
                .font(.title)
        }
        .disabled(📱.🔛 != .PowerOff)
        .sheet(isPresented: $📱.🛠) {
            🛠Option()
        }
    }
}

struct 🛠Option: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                📁ImportFile()
                
                Spacer()
                
                NavigationLink {
                    Text("destination")
                } label: {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.title.bold())
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            .navigationTitle("FadeInAlarm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        🔙.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.secondary)
                            .grayscale(1.0)
                            .padding(8)
                    }
                    .accessibilityLabel("🌏閉じる")
                }
            }
            .fileImporter(isPresented: $📱.📂, allowedContentTypes: [.audio]) { 🅁esult in
                let 🗄 = FileManager.default
                let 🗃 = 🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
                
                do {
                    let 📦 = try 🅁esult.get()
                    
                    do {
                        let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                        if let 📍 = 🗂.first {
                            do { try 🗄.removeItem(at: 📍) } catch { print("👿", error) }
                        }
                    } catch { print(error) }
                    
                    let 🄽ewURL = 🗃.appendingPathComponent(📦.lastPathComponent)
                    
                    if 📦.startAccessingSecurityScopedResource() {
                        do {
                            try 🗄.copyItem(at: 📦, to: 🄽ewURL)
                            📱.💽Name = 🄽ewURL.lastPathComponent
                        } catch { print("👿", error) }
                    }
                    📦.stopAccessingSecurityScopedResource()
                } catch { print("👿", error) }
            }
        }
    }
}


struct 📄Document: View {
    var body: some View {
        List {
            Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                Label("AppStore link", systemImage: "link")
            }
            
            Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                Label("Source code", systemImage: "link")
            }
        }
        .navigationTitle("Document")
    }
}



struct 🛠Option_Previews: PreviewProvider {
    
    static let 📱 = 📱Model()
    
    static var previews: some View {
        🛠Option()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 500, height: 600))
        
        📄Document()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
