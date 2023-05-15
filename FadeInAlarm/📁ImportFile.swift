import SwiftUI
import AVFAudio

struct 📁ImportFile: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var 🚩failToPlay: Bool = false
    var body: some View {
        HStack {
            Button {
                📱.📂showImporter.toggle()
                📱.📻alarm.ⓟlayer.stop()
            } label: {
                HStack(spacing: 7) {
                    Image(systemName: "folder")
                        .font(.title3.weight(.semibold))
                    Text(📱.💽soundFileName)
                        .font(.title3.bold())
                        .kerning(1.5)
                }
                .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
            }
            .accessibilityLabel("Import file")
            📁FilePreview()
        }
        .disabled(📱.🔛phase != .powerOff)
        .padding()
        .fileImporter(isPresented: $📱.📂showImporter, allowedContentTypes: [.audio]) { ⓡesult in
            do {
                let 📦 = try ⓡesult.get()
                if 📦.startAccessingSecurityScopedResource() {
                    if let _ = try? AVAudioPlayer(contentsOf: 📦) {
                        if let ⓞldURL = 💾FileManager.getUserFileURL() {
                            💾FileManager.removeItem(at: ⓞldURL)
                        }
                        let ⓝewURL = 💾FileManager.documentDirectoryURL.appendingPathComponent(📦.lastPathComponent)
                        💾FileManager.copyItem(at: 📦, to: ⓝewURL)
                        📱.💽soundFileName = ⓝewURL.lastPathComponent
                        📱.📻alarm.ⓟreview()
                    } else {
                        self.🚩failToPlay = true
                    }
                }
                📦.stopAccessingSecurityScopedResource()
            } catch {
                print("🚨", error)
            }
        }
        .alert("Fail play file 😱", isPresented: self.$🚩failToPlay) {
            EmptyView()
        }
    }
}

private struct 📁FilePreview: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Button {
            if 📱.📻alarm.ⓟlayer.isPlaying {
                📱.📻alarm.ⓟlayer.stop()
            } else {
                📱.📻alarm.ⓟreview()
            }
        } label: {
            Image(systemName: "playpause.fill")
                .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
        }
        .font(.subheadline)
        .buttonStyle(.bordered)
        .controlSize(.mini)
        .tint(📱.📻alarm.ⓟlayer.isPlaying ? .red : nil)
        .accessibilityLabel("Preview")
    }
}
