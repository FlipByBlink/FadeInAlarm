import SwiftUI
import AVFAudio

struct 📁ImportFileMenu: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var 🚩presentImporter: Bool = false
    @State private var 🚩presentSelectedFileAlert: Bool = false
    @State private var 🚩presentPreviewAlert: Bool = false
    @State private var 🚩failToImport: Bool = false
    @State private var ⓕileName: String? = 💾FileManager.getImportedFileName()
    var body: some View {
        Menu {
            Button {
                self.🚩presentImporter = true
            } label: {
                Label("Import a sound file", systemImage: "folder")
            }
            Button {
                📱.📻player.preview()
                self.🚩presentPreviewAlert = true
            } label: {
                Label("Preview the sound file", systemImage: "play")
            }
        } label: {
            Label(self.ⓕileName ?? String(localized: "preset.mp3"),
                  systemImage: "music.note")
            .bold()
            .labelStyle(.titleAndIcon)
            .imageScale(.medium)
            .frame(width: 280, alignment: .trailing)
        }
        .accessibilityLabel("File menu")
        .alert("Imported \"\(self.ⓕileName ?? "the file")\"", isPresented: self.$🚩presentSelectedFileAlert) {
            Button("OK") { 📱.📻player.stop() }
        } message: {
            Text("Previewing the file")
        }
        .alert("▶️ Previewing", isPresented: self.$🚩presentPreviewAlert) {
            Button("Stop") { 📱.📻player.stop() }
        } message: {
            if let ⓕileName { Text(ⓕileName) }
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
                    📱.📻player.preview()
                    withAnimation { self.ⓕileName = ⓝewFileURL.lastPathComponent }
                    Task {
                        try? await Task.sleep(for: .seconds(0.5))
                        self.🚩presentSelectedFileAlert = true
                    }
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
