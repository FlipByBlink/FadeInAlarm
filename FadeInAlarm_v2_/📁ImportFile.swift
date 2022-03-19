
import SwiftUI


struct 📁ImportFile: View {
    
    @State private var 📂 = false
    
    @State private var 💽Name = "preset.mp3"
    
    
    let 🗄 = FileManager.default
    
    let 🗃 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    
    var body: some View {
        
        Button {
            📂.toggle()
        } label: {
            HStack {
                Image(systemName: "folder")
                
                Text(💽Name)
                    .onAppear {
                        do {
                            let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                            if let 📍 = 🗂.first {
                                💽Name = 📍.lastPathComponent
                            }
                        } catch { print(error) }
                    }
                
                Image(systemName: "repeat")
            }
        }
        .accessibilityLabel("Import file")
        .padding(30)
        .fileImporter(isPresented: $📂, allowedContentTypes: [.audio]) { 🅁esult in
            do {
                let 📦 = try 🅁esult.get()
                
                do {
                    let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                    if let 📍 = 🗂.first {
                        do { try 🗄.removeItem(at: 📍) } catch { print("👿",error) }
                    }
                } catch { print(error) }
                
                let 🄽ewURL = 🗃.appendingPathComponent(📦.lastPathComponent)
                
                if 📦.startAccessingSecurityScopedResource() {
                    do {
                        try 🗄.copyItem(at: 📦, to: 🄽ewURL)
                        💽Name = 🄽ewURL.lastPathComponent
                    } catch { print("👿",error) }
                }
                📦.stopAccessingSecurityScopedResource()
            } catch { print("👿",error) }
        }
    }
}




struct 📁ImportFile_Previews: PreviewProvider {
    static var previews: some View {
        📁ImportFile()
    }
}
