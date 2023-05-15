import SwiftUI

struct 👆VolumeOnWaiting: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu(📱.🔊volumeOnWaiting.description + " %") {
            Picker("Volume on waiting", selection: $📱.🔊volumeOnWaiting) {
                Text("0 %").tag(0)
                Text("1 %").tag(1)
                Text("3 %").tag(3)
                Text("5 %").tag(5)
                Text("10 %").tag(10)
            }
        }
        .font(.caption.bold())
        .frame(width: 54, height: 24, alignment: .trailing)
        .padding(.trailing, 4)
        .lineLimit(1)
        .minimumScaleFactor(0.1)
        .disabled(📱.🔛phase != .powerOff)
        .accessibilityLabel("Select volume on waiting")
    }
}

struct 👆TimeFadeIn: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        DatePicker("Time fade-In", selection: $📱.🕰timeFadeIn, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .onAppear {
                if let 📦 = UserDefaults.standard.value(forKey: "TimeFadeIn") {
                    📱.🕰timeFadeIn = 📦 as! Date
                } else {
                    📱.🕰timeFadeIn = .now + 180
                }
            }
            .onChange(of: 📱.🕰timeFadeIn) {
                UserDefaults.standard.setValue($0, forKey: "TimeFadeIn")
            }
            .disabled(📱.🔛phase != .powerOff)
            .accessibilityLabel("Set time to start fade-in")
    }
}

struct 👆HourFadeIn: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("+ " + (🄲hoices(rawValue: 📱.🕛hourFadein)?.ⓣext ?? "👿") ) {
            Picker("Hour fade-in", selection: $📱.🕛hourFadein) {
                ForEach(🄲hoices.allCases) { Text($0.ⓣext) }
            }
        }
        .font(.body.weight(.heavy))
        .accessibilityLabel("Select hour fade-in")
        .disabled( 📱.🔛phase != .powerOff )
        .foregroundColor(📱.🔛phase != .powerOff ? .secondary : nil)
    }
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
}

struct 👆HourFadeOut: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("+ " + (🄲hoices(rawValue: 📱.🕛hourFadeOut)?.ⓣext ?? "👿")) {
            Picker("Hour fade-out", selection: 📱.$🕛hourFadeOut) {
                ForEach(🄲hoices.allCases) { Text($0.ⓣext) }
            }
        }
        .font(.caption.bold())
        .disabled(📱.🔛phase != .powerOff)
        .accessibilityLabel("Select hour fade-out")
    }
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
}
