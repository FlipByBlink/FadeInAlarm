
import SwiftUI


struct 📁ImportFile: View {
    
    @State private var 📂 = false
    
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    
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
            }
        }
        .font(.title2)
        .accessibilityLabel("Import file")
        .fileImporter(isPresented: $📂, allowedContentTypes: [.audio]) { 🅁esult in
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
                        💽Name = 🄽ewURL.lastPathComponent
                    } catch { print("👿", error) }
                }
                📦.stopAccessingSecurityScopedResource()
            } catch { print("👿", error) }
        }
    }
}


struct 📁FileName: View {
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    var body: some View {
        HStack {
            Text(💽Name)
                .foregroundStyle(.secondary)
                .font(.body.weight(.semibold))
            
            📁FileTestPlay()
        }
        
    }
}


struct 📁FileTestPlay: View {
    @EnvironmentObject var 📱: 📱Model
    
    @State private var nowTestPlaying: Bool = false
    
    var body: some View {
        Button {
            if 📱.🔛 != .PowerOff {
                return
            }
            
            if nowTestPlaying {
                📱.📻.ⓟlayer.stop()
                nowTestPlaying = false
            } else {
                📱.📻.testPlay()
                nowTestPlaying = true
            }
        } label: {
            Image(systemName: "playpause")
                .font(.body.weight(.semibold))
                .foregroundColor(nowTestPlaying ? .red : nil)
                .disabled(📱.🔛 != .PowerOff)
                .opacity(0.75)
        }
        .onChange(of: 📱.🔛) { newValue in
            if newValue == .Waiting {
                nowTestPlaying = false
            }
        }
    }
}




struct 📁ImportFile_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            📁ImportFile()
            
            📁FileName()
        }
        .previewLayout(.fixed(width: 400, height: 400))
    }
}
