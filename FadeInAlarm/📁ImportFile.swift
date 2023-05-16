import SwiftUI
import AVFAudio

struct 📁ImportFileSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var 🚩showImporter: Bool = false
    @State private var ⓕileName: String
    @State private var 🚩failToImport: Bool = false
    var body: some View {
        HStack {
            Button {
                self.🚩showImporter = true
                📱.📻player.stop()
            } label: {
                HStack(spacing: 7) {
                    Image(systemName: "folder")
                        .font(.title3.weight(.semibold))
                    Text(self.ⓕileName)
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
        .fileImporter(isPresented: self.$🚩showImporter, allowedContentTypes: [.audio]) { self.importAction($0) }
        .alert("Fail to import the file 😱", isPresented: self.$🚩failToImport) { EmptyView() }
    }
    init() {
        self.ⓕileName = 💾FileManager.getImportedFileURL()?.lastPathComponent ?? "preset.mp3"
    }
    private func importAction(_ ⓡesult: Result<URL, Error>) {
        do {
            let ⓢelectedFileURL = try ⓡesult.get()
            if ⓢelectedFileURL.startAccessingSecurityScopedResource() {
                if 📻AlarmPlayer.loadable(ⓢelectedFileURL) {
                    if let ⓞldFileURL = 💾FileManager.getImportedFileURL() {
                        💾FileManager.removeItem(at: ⓞldFileURL)
                    }
                    let ⓝewFileURL = 💾FileManager.urlToSave(ⓢelectedFileURL.lastPathComponent)
                    💾FileManager.copyItem(at: ⓢelectedFileURL, to: ⓝewFileURL)
                    self.ⓕileName = ⓝewFileURL.lastPathComponent
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
