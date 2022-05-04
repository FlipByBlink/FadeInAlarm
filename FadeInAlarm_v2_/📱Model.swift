
import Combine
import SwiftUI


class 📱Model: ObservableObject {
    
    let 📻 = 📻AlarmPlayer()
    
    @AppStorage("VolumeOnWaiting") var 🔊VolumeOnWaiting = 3
    
    @Published var 🕰TimeFadeIn = Date.now + 180
    
    @AppStorage("HourFadein") var 🕛HourFadein = 10.0
    
    @AppStorage("HourFadeOut") var 🕛HourFadeOut = 3.0
    
    @Published var 🔛: 🔛Phase = .PowerOff
    
    @Published var 🔔Volume: Int = 0
    
    
    
    
    @Published var 🪧LVP🔍FadeIn = 0.4
    
    @Published var 🪧LVP🔍FadeOut = 0.4
    
    
//    @Published var 📁URL: URL? = {
//        let 🗄 = FileManager.default
//        let 🗃 = 🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        
//        do {
//            let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
//            if let 📍 = 🗂.first {
//                return 📍
//            }
//        } catch { print(error) }
//        
//        return nil
//    }()
}
