
import SwiftUI


struct 👆VolumeOnWaiting: View {
    
//    @Binding var 🎚: Int
    
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Menu( 📱.🔊VolumeOnWaiting.description + "%" ) {
            Picker("Volume on waiting", selection: $📱.🔊VolumeOnWaiting) {
                Text("0%").tag(0)
                Text("1%").tag(1)
                Text("3%").tag(3)
                Text("5%").tag(5)
                Text("10%").tag(10)
            }
        }
        .font(.caption.bold())
        .disabled( 📱.🔛 != .PowerOff )
        .accessibilityLabel("Select volume on waiting")
    }
    
//    init(_ 🎚: Binding<Int>) {
//        self._🎚 = 🎚
//    }
}




struct 👆TimeFadeIn: View {
    
//    @Binding var 🎚: Date
    
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        DatePicker("Time fade-In", selection: $📱.🕰TimeFadeIn, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .dynamicTypeSize(.accessibility2)
            .padding()
            .padding(.leading, 9)
            .onAppear {
                if let t︭ime = UserDefaults.standard.value(forKey: "TimeFadeIn") {
                    📱.🕰TimeFadeIn = t︭ime as! Date
                } else {
                    📱.🕰TimeFadeIn = Date.now + 180
                }
            }
            .onChange(of: 📱.🕰TimeFadeIn) { t︭ime in
                UserDefaults.standard.setValue(t︭ime, forKey: "TimeFadeIn")
            }
            .disabled( 📱.🔛 != .PowerOff )
            .accessibilityLabel("Set time to start fade-in")
    }
    
//    init(_ 🎚: Binding<Date>) {
//        self._🎚 = 🎚
//    }
}




struct 👆HourFadeIn: View {
    
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
    
//    @Binding var 🎚: TimeInterval
    
    @EnvironmentObject var 📱: 📱Model
    
//    var 🔛: 🔛Phase
    
    var body: some View {
        Menu( "+ " + (🄲hoices(rawValue: 📱.🕛HourFadein)?.ⓣext ?? "👿") ) {
            Picker("Hour fade-in", selection: $📱.🕛HourFadein) {
                ForEach(🄲hoices.allCases) { 🄲hoice in
                    Text(🄲hoice.ⓣext)
                }
            }
        }
        .font(.title.bold())
        .accessibilityLabel("Select hour fade-in")
        .disabled( 📱.🔛 != .PowerOff )
        .foregroundColor(📱.🔛 != .PowerOff ? .secondary : nil)
    }
    
//    init(/*_ 🎚: Binding<TimeInterval>,*/ _ 🔛: 🔛Phase) {
////        self._🎚 = 🎚
//        self.🔛 = 🔛
//    }
}




struct 👆HourFadeOut: View {
    
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
    
//    @Binding var 🎚: TimeInterval
    
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Menu( "+ " + (🄲hoices(rawValue: 📱.🕛HourFadeOut)?.ⓣext ?? "👿") ) {
            Picker("Hour fade-out", selection: 📱.$🕛HourFadeOut) {
                ForEach(🄲hoices.allCases) { 🄲hoice in
                    Text(🄲hoice.ⓣext)
                }
            }
        }
        .font(.body.bold())
        .disabled( 📱.🔛 != .PowerOff )
        .accessibilityLabel("Select hour fade-out")
    }
    
//    init(_ 🎚: Binding<TimeInterval>) {
//        self._🎚 = 🎚
//    }
}




struct 👆Menu_Previews: PreviewProvider {
    
    static let 📱 = 📱Model()

    static var previews: some View {
        VStack {
            👆VolumeOnWaiting()
            👆TimeFadeIn()
            👆HourFadeIn()
            👆HourFadeIn()
            👆HourFadeOut()
        }
        .environmentObject(📱)
        .previewLayout(.fixed(width: 300, height: 600))
        
        VStack {
            👆VolumeOnWaiting()
            👆TimeFadeIn()
            👆HourFadeIn()
            👆HourFadeIn()
            👆HourFadeOut()
        }
        .environmentObject(📱)
        .previewLayout(.fixed(width: 300, height: 600))
        .preferredColorScheme(.dark)
    }
}
