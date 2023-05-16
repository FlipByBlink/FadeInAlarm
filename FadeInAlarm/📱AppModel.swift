import SwiftUI

class 📱AppModel: ObservableObject {
    
    let 📻player = 📻AlarmPlayer()

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
    
    init() {
        if let ⓤserFileURL = 💾FileManager.getImportedFileURL() {
            self.💽soundFileName = ⓤserFileURL.lastPathComponent
        } else {
            self.💽soundFileName = "preset.mp3"
        }
    }
}
