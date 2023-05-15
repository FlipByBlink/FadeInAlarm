import SwiftUI

class 📱AppModel: ObservableObject {
    
    let 📻alarm = 📻AlarmPlayer()

    @AppStorage("VolumeOnWaiting") var 🔊volumeOnWaiting: Int = 3
    @Published var 🕰timeFadeIn: Date = .now + 180
    @AppStorage("HourFadein") var 🕛hourFadein: Double = 10.0
    @AppStorage("HourFadeOut") var 🕛hourFadeOut: Double = 3.0
    
    @Published var 🔛phase: 🔛Phase = .powerOff
    @Published var 🔔volume: Int = 0
    
    @Published var 📂showImporter: Bool = false
    @Published var 💽soundFileName: String
    
    @Published var 📄showDocument: Bool = false
    
    @Published var 🔍scaleLVPFadeIn: Double = 0.4
    @Published var 🔍scaleLVPFadeOut: Double = 0.4
    
    init () {
        if let ⓤrl = 💾FileManager.getUserFileURL() {
            self.💽soundFileName = ⓤrl.lastPathComponent
        } else {
            self.💽soundFileName = "preset.mp3"
        }
    }
}

enum 💾FileManager {
    private static let api: FileManager = .default
    static let documentDirectoryURL = Self.api.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static func getUserFileURL() -> URL? {
        do {
            let ⓤrls = try Self.api.contentsOfDirectory(at: Self.documentDirectoryURL, includingPropertiesForKeys: nil)
            guard ⓤrls.count <= 1 else { assertionFailure(); return nil }
            return ⓤrls.first
        } catch {
            assertionFailure(); return nil
        }
    }
    static func removeItem(at ⓤrl: URL) {
        do {
            try Self.api.removeItem(at: ⓤrl)
        } catch {
            print("🚨", error)
            assertionFailure()
        }
    }
    static func copyItem(at ⓢrcURL: URL, to ⓓstURL: URL) {
        do {
            try Self.api.copyItem(at: ⓢrcURL, to: ⓓstURL)
        } catch {
            print("🚨", error)
            assertionFailure()
        }
    }
}
