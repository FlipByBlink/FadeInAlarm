import SwiftUI
import AVFAudio

struct 📁ImportFileSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        HStack {
            Button {
                📱.📂showImporter.toggle()
                📱.📻player.stop()
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
            🄿reviewButton()
        }
        .disabled(📱.🔛phase != .powerOff)
        .padding()
        .modifier(🄵ileImporter())
    }
}

private struct 🄵ileImporter: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var 🚩failToImport: Bool = false
    func body(content: Content) -> some View {
        content
            .fileImporter(isPresented: $📱.📂showImporter, allowedContentTypes: [.audio]) { ⓡesult in
                do {
                    let ⓢelectedFileURL = try ⓡesult.get()
                    if ⓢelectedFileURL.startAccessingSecurityScopedResource() {
                        if 📻AlarmPlayer.loadable(ⓢelectedFileURL) {
                            if let ⓞldFileURL = 💾FileManager.getImportedFileURL() {
                                💾FileManager.removeItem(at: ⓞldFileURL)
                            }
                            let ⓝewFileURL = 💾FileManager.urlToSave(ⓢelectedFileURL.lastPathComponent)
                            💾FileManager.copyItem(at: ⓢelectedFileURL, to: ⓝewFileURL)
                            📱.💽soundFileName = ⓝewFileURL.lastPathComponent
                            📱.📻player.preview()
                        } else {
                            self.🚩failToImport = true
                        }
                    }
                    ⓢelectedFileURL.stopAccessingSecurityScopedResource()
                } catch {
                    print("🚨", error)
                }
            }
            .alert("Fail to import the file 😱", isPresented: self.$🚩failToImport) { EmptyView() }
    }
}

private struct 🄿reviewButton: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Button {
            if 📱.📻player.isPlaying {
                📱.📻player.stop()
            } else {
                📱.📻player.preview()
            }
        } label: {
            Image(systemName: "playpause.fill")
                .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
        }
        .font(.subheadline)
        .buttonStyle(.bordered)
        .controlSize(.mini)
        .tint(📱.📻player.isPlaying ? .red : nil)
        .accessibilityLabel("Preview")
    }
}
