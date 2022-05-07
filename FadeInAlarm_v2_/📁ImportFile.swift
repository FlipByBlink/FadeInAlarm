
import SwiftUI


struct 📁ImportFile: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Section {
            Button {
                📱.📂.toggle()
            } label: {
                Image(systemName: "folder.badge.plus")
                    .symbolRenderingMode(.multicolor)
                    .font(.largeTitle)
            }
            .accessibilityLabel("Import file")
            
            📁FileName()
            
            📁FilePreview()
        }
    }
}


struct 📁FileName: View {
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    var body: some View {
        Text(💽Name)
            .kerning(1.5)
            .foregroundStyle(.secondary)
            .font(.headline)
            .task {
                let 🗄 = FileManager.default
                let 🗃 = 🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
                do {
                    let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                    if let 📍 = 🗂.first {
                        💽Name = 📍.lastPathComponent
                    }
                } catch { print(error) }
            }
    }
}


struct 📁FilePreview: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Button {
            if 📱.📻.ⓟlayer.isPlaying {
                📱.📻.ⓟlayer.stop()
            } else {
                📱.📻.ⓟreview()
            }
        } label: {
            Image(systemName: "playpause")
                .font(.body.weight(.semibold))
                .foregroundColor(📱.📻.ⓟlayer.isPlaying ? .red : nil)
                .opacity(0.75)
                .onChange(of: 📱.💽Name) { _ in
                    📱.📻.ⓟlayer.stop()
                }
        }
    }
}








struct 📁ImportFile_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        VStack(spacing: 8) {
            📁ImportFile()
            
            📁FileName()
            
            📁FilePreview()
        }
        .previewLayout(.fixed(width: 200, height: 200))
        .environmentObject(📱)
    }
}
