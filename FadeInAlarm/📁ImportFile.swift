import SwiftUI
import AVFAudio

struct 📁ImportFileSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var 🚩presentImporter: Bool = false
    @State private var ⓕileName: String = 💾FileManager.getImportedFileName() ?? "preset.mp3"
    @State private var 🚩failToImport: Bool = false
    var body: some View {
        Group {
            Button {
                self.🚩presentImporter = true
                📱.📻player.stop()
            } label: {
                Label(self.ⓕileName, systemImage: "music.note")
                    .bold()
                    .labelStyle(.titleAndIcon)
                    .imageScale(.medium)
                    .foregroundStyle(📱.🔛phase == .powerOff ? .primary : .tertiary)
            }
            .accessibilityLabel("Import file")
            🄿reviewButton()
        }
        .disabled(📱.🔛phase != .powerOff)
        .alert("Fail to import the file 😱", isPresented: self.$🚩failToImport) { EmptyView() }
        .fileImporter(isPresented: self.$🚩presentImporter,
                      allowedContentTypes: [.audio],
                      onCompletion: self.importAction(_:))
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
        .font(.caption)
        .buttonStyle(.bordered)
        .controlSize(.mini)
        .tint(📱.📻player.isPlaying ? .red : nil) //FIXME: 適切に動作してない
        .accessibilityLabel("Preview")
    }
}
