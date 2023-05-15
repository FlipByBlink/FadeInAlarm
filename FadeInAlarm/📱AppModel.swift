import SwiftUI

class 📱AppModel: ObservableObject {
    
    let 📻alarm = 📻AlarmPlayer()

    
    @AppStorage("VolumeOnWaiting") var 🔊volumeOnWaiting = 3
    
    @Published var 🕰timeFadeIn: Date = .now + 180
    
    @AppStorage("HourFadein") var 🕛hourFadein = 10.0
    
    @AppStorage("HourFadeOut") var 🕛hourFadeOut = 3.0
    
    @Published var 🔛phase: 🔛Phase = .powerOff
    
    @Published var 🔔volume: Int = 0
    
    
    @Published var 📂showImporter = false
    
    @Published var 💽soundFileName: String
    
    
    @Published var 📄showDocument = false
    
    
    @Published var 🪧LVP🔍FadeIn = 0.4
    
    @Published var 🪧LVP🔍FadeOut = 0.4
    
    
    init () {
        do {
            let ⓓocumentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let ⓒontentsURL = try FileManager.default.contentsOfDirectory(at: ⓓocumentDirectoryURL, includingPropertiesForKeys: nil)
            if let ⓤrl = ⓒontentsURL.first {
                self.💽soundFileName = ⓤrl.lastPathComponent
                return
            }
        } catch {
            print("🚨", error)
        }
        self.💽soundFileName = "preset.mp3"
    }
}
