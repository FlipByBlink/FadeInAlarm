
import Combine
import SwiftUI


class 📱Model: ObservableObject {
    
//    @Published var 🔊VolumeOnWaiting = 3
    
    @AppStorage("VolumeOnWaiting") var 🔊VolumeOnWaiting = 3
    
    @Published var 🕰TimeFadeIn = Date.now + 180
    
//    @Published var 🕛HourFadein = 10.0
//
//    @Published var 🕛HourFadeOut = 3.0
    
    @AppStorage("HourFadein") var 🕛HourFadein = 10.0
    
    @AppStorage("HourFadeOut") var 🕛HourFadeOut = 3.0
    
    @Published var 🔛: 🔛Phase = .PowerOff
    
    @Published var 🔔Volume: Int = 0
    
    let 📻 = 📻AlarmPlayer()
    
}
