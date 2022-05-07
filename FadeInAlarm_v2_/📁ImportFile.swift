
import SwiftUI


struct 📁ImportFile: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        VStack {
            Button {
                📱.📂.toggle()
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: "folder.badge.plus")
                        .font(.system(size: 72).bold())
                        .symbolRenderingMode(.multicolor)
                    
                    📁FileName()
                }
            }
            .accessibilityLabel("Import file")
            
            📁FilePreview()
        }
        .padding()
    }
}


struct 📁FileName: View {
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    var body: some View {
        Text(💽Name)
            .kerning(1.5)
            .foregroundStyle(.secondary)
            .font(.largeTitle.bold())
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
            Image(systemName: "playpause.fill")
                .foregroundStyle(.secondary)
                .onChange(of: 📱.💽Name) { _ in
                    📱.📻.ⓟlayer.stop()
                }
        }
        .buttonStyle(.bordered)
        .tint(📱.📻.ⓟlayer.isPlaying ? .red : nil)
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
        .previewLayout(.fixed(width: 400, height: 600))
        .environmentObject(📱)
    }
}
