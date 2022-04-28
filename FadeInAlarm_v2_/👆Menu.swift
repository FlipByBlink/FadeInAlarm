
import SwiftUI


struct 👆🔊VolumeOnWaiting: View {
    
    @Binding var 🎚: Int
    
    var body: some View {
        Menu( 🎚.description + "%" ) {
            Picker("Volume on waiting", selection: $🎚) {
                Text("0%").tag(0)
                Text("1%").tag(1)
                Text("3%").tag(3)
                Text("5%").tag(5)
                Text("10%").tag(10)
            }
        }
        .font(.caption.bold())
        .accessibilityLabel("Select volume on waiting")
    }
    
    init(_ selected: Binding<Int>) {
        _🎚 = selected
    }
}




struct 👆🕰TimeFadeIn: View {
    
    @Binding var 🎚: Date
    
    var body: some View {
        DatePicker("Time fade-In", selection: $🎚, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .dynamicTypeSize(.accessibility2)
            .padding()
            .padding(.leading, 9)
            .onAppear {
                if let t︭ime = UserDefaults.standard.value(forKey: "TimeFadeIn") {
                    🎚 = t︭ime as! Date
                } else {
                    🎚 = Date.now + 180
                }
            }
            .onChange(of: 🎚) { t︭ime in
                UserDefaults.standard.setValue(t︭ime, forKey: "TimeFadeIn")
            }
            .accessibilityLabel("Set time to start fade-in")
    }
    
    init(_ selected: Binding<Date>) {
        _🎚 = selected
    }
}




struct 👆🕛HourFadeIn: View {
    
    enum 🄲hoices: Double, CaseIterable, Identifiable {
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
    
    @Binding var 🎚: TimeInterval
    
    var ⓝow: 🔛Phase
    
    var body: some View {
        Menu( "+ " + (🄲hoices(rawValue: 🎚)?.ⓣext ?? "👿") ) {
            Picker("Hour fade-in", selection: $🎚) {
                ForEach(🄲hoices.allCases) { 🄲hoice in
                    Text(🄲hoice.ⓣext)
                }
            }
        }
        .font(.title.bold())
        .accessibilityLabel("Select hour fade-in")
        .disabled( ⓝow != .PowerOff )
        .foregroundColor(ⓝow != .PowerOff ? .secondary : nil)
    }
    
    init(_ selected: Binding<TimeInterval>, now: 🔛Phase) {
        _🎚 = selected
        ⓝow = now
    }
}




struct 👆🕛HourFadeOut: View {
    
    enum 🄲hoices: Double, CaseIterable, Identifiable {
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
    
    @Binding var 🎚: TimeInterval
    
    var body: some View {
        Menu( "+ " + (🄲hoices(rawValue: 🎚)?.ⓣext ?? "👿") ) {
            Picker("Hour fade-out", selection: $🎚) {
                ForEach(🄲hoices.allCases) { 🄲hoice in
                    Text(🄲hoice.ⓣext)
                }
            }
        }
        .font(.body.bold())
        .accessibilityLabel("Select hour fade-out")
    }
    
    init(_ selected: Binding<TimeInterval>) {
        _🎚 = selected
    }
}




struct 👆Menu_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            👆🔊VolumeOnWaiting(.constant(1))
            👆🕰TimeFadeIn(.constant(Date()))
            👆🕛HourFadeIn(.constant(10), now: .PowerOff)
            👆🕛HourFadeIn(.constant(10), now: .Waiting)
            👆🕛HourFadeOut(.constant(7))
        }
        .previewLayout(.fixed(width: 300, height: 600))
        
        VStack {
            👆🔊VolumeOnWaiting(.constant(1))
            👆🕰TimeFadeIn(.constant(Date()))
            👆🕛HourFadeIn(.constant(10), now: .PowerOff)
            👆🕛HourFadeIn(.constant(10), now: .Waiting)
            👆🕛HourFadeOut(.constant(7))
        }
        .previewLayout(.fixed(width: 300, height: 600))
        .preferredColorScheme(.dark)
    }
}
