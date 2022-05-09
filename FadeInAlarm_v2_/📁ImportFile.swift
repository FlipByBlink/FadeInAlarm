
import SwiftUI
import AVFAudio


struct 📁ImportFile: View {
    @EnvironmentObject var 📱: 📱Model
    
    @State private var 🚩FailPlay: Bool = false
    
    var body: some View {
        VStack {
            Button {
                📱.📂ImporterAppear.toggle()
                📱.📻.ⓟlayer.stop()
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: "folder.badge.plus")
                        .font(.system(size: 72).bold())
                        .symbolRenderingMode(.multicolor)
                    
                    📁FileName()
                        .font(.title.bold())
                }
            }
            .accessibilityLabel("Import file")
            
            📁FilePreview()
        }
        .padding()
        .fileImporter(isPresented: $📱.📂ImporterAppear, allowedContentTypes: [.audio]) { 🅁esult in
            let 🗄 = FileManager.default
            let 🗃 = 🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            do {
                let 📦 = try 🅁esult.get()
                
                if 📦.startAccessingSecurityScopedResource() {
                    if let _ = try? AVAudioPlayer(contentsOf: 📦) {
                        do {
                            let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                            if let 🄾ldURL = 🗂.first {
                                do { try 🗄.removeItem(at: 🄾ldURL) } catch { print("👿", error) }
                            }
                        } catch { print(error) }
                        
                        let 🄽ewURL = 🗃.appendingPathComponent(📦.lastPathComponent)
                        
                        do {
                            try 🗄.copyItem(at: 📦, to: 🄽ewURL)
                            📱.💽Name = 🄽ewURL.lastPathComponent
                            📱.📻.ⓟreview()
                        } catch { print("👿", error) }
                    } else {
                        🚩FailPlay = true
                    }
                }
                📦.stopAccessingSecurityScopedResource()
            } catch { print("👿", error) }
        }
        .alert("Fail play file 😱", isPresented: $🚩FailPlay) {
            EmptyView()
        }
    }
}


struct 📁FileName: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Text(📱.💽Name)
            .kerning(1.5)
            .foregroundStyle(.secondary)
            .task {
                let 🗄 = FileManager.default
                let 🗃 = 🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
                do {
                    let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                    if let 📍 = 🗂.first {
                        📱.💽Name = 📍.lastPathComponent
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
        }
        .buttonStyle(.bordered)
        .tint(📱.📻.ⓟlayer.isPlaying ? .red : nil)
        .onChange(of: 📱.🛠OptionAppear) { _ in
            📱.📻.ⓟlayer.stop()
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
        .previewLayout(.fixed(width: 400, height: 600))
        .environmentObject(📱)
    }
}
