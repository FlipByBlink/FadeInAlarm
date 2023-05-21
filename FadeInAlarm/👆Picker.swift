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
        .font(.caption)
        .fontWeight(📱.🔛phase == .waiting ? .heavy : .bold)
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
            .accessibilityLabel("Set time to start fade-in")
            .disabled(📱.🔛phase != .powerOff)
            .onChange(of: 📱.🕰timeFadeIn, perform: self.saveValue(_:))
            .onAppear(perform: self.loadValue)
    }
    private func saveValue(_ ⓓate: Date) {
        UserDefaults.standard.setValue(ⓓate, forKey: "TimeFadeIn")
    }
    private func loadValue() {
        if let ⓢavedValue = UserDefaults.standard.value(forKey: "TimeFadeIn") {
            📱.🕰timeFadeIn = ⓢavedValue as! Date
        } else {
            📱.🕰timeFadeIn = Self.getTimeAfterThreeMinutes()
        }
    }
    private static func getTimeAfterThreeMinutes() -> Date {
        Calendar.current
            .date(bySetting: .second, value: 0, of: .now)?
            .addingTimeInterval(120) ?? Calendar.current.startOfDay(for: .now)
    }
}

struct 👆FadeInHourPicker: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("+ \(Self.🄾ption(rawValue: 📱.🕛hourFadein)?.label ?? "👿")") {
            Picker("Hour fade-in", selection: $📱.🕛hourFadein) {
                ForEach(Self.🄾ption.allCases) { Text($0.label) }
            }
        }
        .font(.body.weight(.heavy))
        .accessibilityLabel("Select hour fade-in")
        .disabled(📱.🔛phase != .powerOff)
    }
    enum 🄾ption: Double, CaseIterable, Identifiable {
        case second10 = 10.0
        case second30 = 30.0
        case minute01 = 60.0
        case minute05 = 300.0
        case minute30 = 1800.0
        case hour01 = 3600.0
        var id: Double { self.rawValue }
        var label: String {
            switch self {
                case .second10: return "0:00:10"
                case .second30: return "0:00:30"
                case .minute01: return "0:01:00"
                case .minute05: return "0:05:00"
                case .minute30: return "0:30:00"
                case .hour01: return "1:00:00"
            }
        }
    }
}

struct 👆FadeOutHourPicker: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Menu("+ \(Self.🄾ption(rawValue: 📱.🕛hourFadeOut)?.label ?? "👿")") {
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
        var id: Double { self.rawValue }
        var label: String {
            switch self {
                case .second3: return "0:00:03"
                case .second7: return "0:00:07"
                case .second15: return "0:00:15"
                case .second30: return "0:00:30"
                case .minute01: return "0:01:00"
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
