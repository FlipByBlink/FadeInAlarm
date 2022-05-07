
import SwiftUI


struct 📁ImportFile: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        HStack {
            Button {
                📱.📂.toggle()
            } label: {
                HStack {
                    Image(systemName: "folder.badge.plus")
                        .symbolRenderingMode(.multicolor)
                        .font(.largeTitle.weight(.semibold))
                        .padding(8)
                    
                    📁FileName()
                }
            }
            .accessibilityLabel("Import file")
            
            Spacer()
            
            📁FilePreview()
                .buttonStyle(.borderless)
        }
        .padding(8)
    }
}


struct 📁FileName: View {
    @AppStorage("💽Name") var 💽Name = "preset.mp3"
    
    var body: some View {
        Text(💽Name)
            .kerning(1.5)
            .foregroundStyle(.secondary)
            .font(.title2.bold())
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
