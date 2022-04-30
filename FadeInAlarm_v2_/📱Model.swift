
import Combine
import SwiftUI


class 📱Model: ObservableObject {
    
    @AppStorage("VolumeOnWaiting") var 🔊VolumeOnWaiting = 3
    
    @Published var 🕰TimeFadeIn = Date.now + 180
    
    @AppStorage("HourFadein") var 🕛HourFadein = 10.0
    
    @AppStorage("HourFadeOut") var 🕛HourFadeOut = 3.0
    
    @Published var 🔛: 🔛Phase = .PowerOff
    
    @Published var 🔔Volume: Int = 0
    
    let 📻 = 📻AlarmPlayer()
}
