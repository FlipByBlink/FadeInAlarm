import SwiftUI

struct 👆WaitingVolumePicker: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("\(📱.🔊volumeOnWaiting) %") {
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

struct 👆FadeInTimePicker: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        DatePicker("Time fade-In", selection: $📱.🕰timeFadeIn, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .onAppear {
                if let ⓢavedValue = UserDefaults.standard.value(forKey: "TimeFadeIn") {
                    📱.🕰timeFadeIn = ⓢavedValue as! Date
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

struct 👆FadeInHourPicker: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("+ " + (Self.🄾ption(rawValue: 📱.🕛hourFadein)?.label ?? "👿") ) {
            Picker("Hour fade-in", selection: $📱.🕛hourFadein) {
                ForEach(Self.🄾ption.allCases) { Text($0.label) }
            }
        }
        .font(.body.weight(.heavy))
        .accessibilityLabel("Select hour fade-in")
        .disabled(📱.🔛phase != .powerOff)
        .foregroundColor(📱.🔛phase != .powerOff ? .secondary : nil)
    }
    enum 🄾ption: Double, CaseIterable, Identifiable {
        case second10 = 10.0
        case second30 = 30.0
        case minute01 = 60.0
        case minute05 = 300.0
        case minute30 = 1800.0
        case hour01 = 3600.0
        var id: Self { self }
        var label: String {
            switch self {
                case .second10: return "0:10"
                case .second30: return "0:30"
                case .minute01: return "1:00"
                case .minute05: return "5:00"
                case .minute30: return "30:00"
                case .hour01: return "1:00:00"
            }
        }
    }
}

struct 👆FadeOutHourPicker: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("+ " + (Self.🄾ption(rawValue: 📱.🕛hourFadeOut)?.label ?? "👿")) {
            Picker("Hour fade-out", selection: 📱.$🕛hourFadeOut) {
                ForEach(Self.🄾ption.allCases) { Text($0.label) }
            }
        }
        .font(.caption.bold())
        .disabled(📱.🔛phase != .powerOff)
        .accessibilityLabel("Select hour fade-out")
    }
    enum 🄾ption: Double, CaseIterable, Identifiable {
        case second3 = 3.0
        case second7 = 7.0
        case second15 = 15.0
        case second30 = 30.0
        case minute01 = 60.0
        var id: Self { self }
        var label: String {
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

//TODO: 再検討
//@AppStorage("TimeFadeIn") var 🕰timeFadeIn: Date = .now + 180
//extension Date: RawRepresentable {
//    public var rawValue: String { ISO8601DateFormatter().string(from: self) }
//    public init?(rawValue: String) { self = ISO8601DateFormatter().date(from: rawValue) ?? Self() }
//}
