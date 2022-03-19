
import SwiftUI


struct 👆🔊VolumeOnWaiting: View {
    
    @Binding var ⓢelected: Int
    
    var body: some View {
        Menu( ⓢelected.description + "%" ) {
            Picker("Volume on waiting", selection: $ⓢelected) {
                Text("0%").tag(0)
                Text("1%").tag(1)
                Text("3%").tag(3)
                Text("5%").tag(5)
                Text("10%").tag(10)
            }
        }
        .font(.caption)
        .accessibilityLabel("Select volume on waiting")
    }
}




struct 👆🕰TimeFadeIn: View {
    
    @Binding var ⓢelected: Date
    
    var body: some View {
        DatePicker("", selection: $ⓢelected, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .padding()
            .onAppear {
                if let 🅃ime = UserDefaults.standard.value(forKey: 💾Data.🕰TimeFadeIn.rawValue) {
                    ⓢelected = 🅃ime as! Date
                } else {
                    ⓢelected = Date.now + 180
                }
            }
            .onChange(of: ⓢelected) { 🅃ime in
                UserDefaults.standard.setValue(🅃ime,forKey: 💾Data.🕰TimeFadeIn.rawValue)
            }
            .accessibilityLabel("Set time to start fade-in")
    }
}




enum 🄲hoicesFadeIn: Double, CaseIterable, Identifiable {
    
    case second10 =  10.0
    case second30 = 30.0
    case minute01 = 60.0
    case minute05 = 300.0
    case minute30 = 1800.0
    case hour01 = 3600.0
    
    var id: Double { self.rawValue }
    
    var ⓣext: String {
        switch self {
        case .second10: return "0:10"
        case .second30: return "0:30"
        case .minute01: return "1:00"
        case .minute05: return "5:00"
        case .minute30: return "30:00"
        case .hour01:  return "1:00:00"
        }
    }
}

struct 👆🕛HourFadeIn: View {
    
    @Binding var ⓢelected: TimeInterval
    
    var body: some View {
        Menu( "+ " + (🄲hoicesFadeIn(rawValue: ⓢelected)?.ⓣext ?? "👿") ) {
            Picker("", selection: $ⓢelected) {
                ForEach(🄲hoicesFadeIn.allCases) { 🄲hoice in
                    Text(🄲hoice.ⓣext)
                }
            }
        }
        .accessibilityLabel("Select hour fade-in")
    }
}




enum 🄲hoicesFadeOut: Double, CaseIterable, Identifiable {
    
    case second3 =  3.0
    case second7 =  7.0
    case second15 = 15.0
    case second30 =  30.0
    case minute01 = 60.0
    
    var id: Double { self.rawValue }
    
    var ⓣext: String {
        switch self {
        case .second3: return "0:03"
        case .second7: return "0:07"
        case .second15: return "0:15"
        case .second30: return "0:30"
        case .minute01: return "1:00"
        }
    }
}

struct 👆🕛HourFadeOut: View {
    
    @Binding var ⓢelected: TimeInterval
    
    var body: some View {
        Menu( "+ " + (🄲hoicesFadeOut(rawValue: ⓢelected)?.ⓣext ?? "👿") ) {
            Picker("", selection: $ⓢelected) {
                ForEach(🄲hoicesFadeOut.allCases) { 🄲hoice in
                    Text(🄲hoice.ⓣext)
                }
            }
        }
        .font(.caption)
        .accessibilityLabel("Select hour fade-out")
    }
}




struct PickerTest_Previews: PreviewProvider {
    static var previews: some View {
        👆🔊VolumeOnWaiting(ⓢelected: .constant(1))
        
        👆🕰TimeFadeIn(ⓢelected: .constant(Date()))
        
        👆🕛HourFadeIn(ⓢelected: .constant(10))
        
        👆🕛HourFadeOut(ⓢelected: .constant(7))
    }
}
