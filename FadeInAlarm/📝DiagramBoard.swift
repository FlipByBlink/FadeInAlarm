import SwiftUI

struct 📝DiagramBoard: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                🅂etAlarmSection()
                🅆aitingSection()
                🅂tartFadeInSection()
                🄳uringFadeInSection()
                🄴ndFadeInSection()
                🄼axVolumeSection()
            }
            .padding(24)
            Divider()
            VStack(spacing: 8) {
                🅂topAlarmSection()
                🄵adeOutHourSection()
            }
            .padding(16)
        }
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(Color(uiColor: .systemBackground))
                .shadow(radius: 3)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: 460)
        .animation(.default, value: 📱.🔛phase)
    }
}

private struct 🄿ercentageLabel: View {
    private var ⓥalue: Int
    var body: some View {
        Text("\(self.ⓥalue) %")
            .font(.caption.monospacedDigit())
            .fontWeight(.semibold)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .fixedSize()
    }
    init(_ value: Int) {
        self.ⓥalue = value
    }
}

private struct 🅂peakerIcon: View {
    var name: String
    var alignment: Alignment = .center
    var body: some View {
        ZStack(alignment: self.alignment) {
            self.ⓑaseFrame()
            Image(systemName: self.name)
        }
        .fontWeight(.semibold)
        .padding(.trailing, 6)
    }
    private func ⓑaseFrame() -> some View {
        Image(systemName: "speaker.wave.3").opacity(0)
    }
}

private struct 🄸ndicator: View { // →
    @EnvironmentObject private var 📱: 📱AppModel
    var phase: 🔛Phase
    var body: some View {
        if self.phase == 📱.🔛phase {
            Image(systemName: "arrowshape.right")
                .fontWeight(.semibold)
                .padding(.trailing, 4)
        }
    }
}

private struct 🄵lowArrow: View {
    var body: some View {
        Text("⇣")
            .fontWeight(.bold)
            .font(.largeTitle)
            .padding(.horizontal, 4)
    }
}

private struct 🅂etAlarmSection: View { // ⏻
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .powerOff }
    var body: some View {
        Button {
            📱.startAlarm()
        } label: {
            Label {
                Text("Set")
                    .padding(.horizontal, 6)
            } icon: {
                Image(systemName: "power")
            }
            .bold()
            .padding(.horizontal, 4)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .shadow(radius: self.ⓐctive ? 2 : 0)
        .disabled(!self.ⓐctive)
    }
}

private struct 🅆aitingSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .waiting }
    private var ⓢtyle: HierarchicalShapeStyle {
        [.fadeIn, .maxVolume, .fadeOut].contains(📱.🔛phase) ? .secondary : .primary
    }
    var body: some View {
        🄵lowArrow()
            .foregroundStyle(self.ⓢtyle)
            .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
            .overlay(alignment: .leading) {
                HStack {
                    🄸ndicator(phase: .waiting)
                    👆WaitingVolumePicker()
                        .foregroundColor(self.ⓐctive ? .primary : nil)
                    🅂peakerIcon(name: 📱.🔊volumeOnWaiting == 0 ? "speaker" : "speaker.wave.1",
                                 alignment: .leading)
                    .foregroundStyle(self.ⓐctive ? .primary : .secondary)
                }
                .fixedSize()
                .alignmentGuide(.leading) { $0.width }
            }
    }
}

private struct 🅂tartFadeInSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        👆FadeInTimePicker()
            .opacity([.fadeIn, .maxVolume, .fadeOut].contains(📱.🔛phase) ? 0.6 : 1)
    }
}

private struct 🄳uringFadeInSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓛevel: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    private var ⓦaveValue: Int { Int(Double(self.ⓛevel) / 34) + 1 }
    private var ⓐctive: Bool { 📱.🔛phase == .fadeIn }
    var body: some View {
        🄵lowArrow()
            .foregroundStyle([.maxVolume, .fadeOut].contains(📱.🔛phase) ? .secondary : .primary)
            .overlay(alignment: .leading) {
                HStack {
                    🄸ndicator(phase: .fadeIn)
                    if self.ⓐctive {
                        🄿ercentageLabel(📱.🔔localVolume)
                            .fontWeight(.heavy)
                            .animation(.default, value: 📱.🔔localVolume)
                    } else {
                        🄿ercentageLabel(self.ⓛevel)
                            .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
                    }
                    🅂peakerIcon(name: "speaker.wave.\(self.ⓦaveValue)", alignment: .leading)
                        .foregroundStyle(self.ⓐctive ? .primary : .secondary)
                }
                .alignmentGuide(.leading) { $0.width }
            }
            .overlay(alignment: .trailing) {
                👆FadeInHourPicker()
                    .foregroundColor(self.ⓐctive ? .primary : nil)
                    .fixedSize()
                    .alignmentGuide(.trailing) { _ in -10 }
            }
            .onReceive(self.ⓣimer) { _ in self.ⓣimerAction() }
    }
    private func ⓣimerAction() {
        guard !self.ⓟause else { return }
        if self.ⓛevel == 100 {
            Task {
                self.ⓟause = true
                try? await Task.sleep(for: .seconds(0.35))
                self.ⓛevel = 📱.🔊volumeOnWaiting
                self.ⓟause = false
            }
        } else {
            self.ⓛevel += 1
        }
    }
}

private struct 🄴ndFadeInSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓣimeLabel: String {
        📱.🕰timeFadeIn.addingTimeInterval(📱.🕛hourFadein)
            .formatted(date: .omitted, time: 📱.🕛hourFadein < 60 ? .standard : .shortened)
    }
    var body: some View {
        Text(self.ⓣimeLabel)
            .font(.caption2.weight(.regular).italic())
            .foregroundStyle([.maxVolume, .fadeOut].contains(📱.🔛phase) ? .secondary : .primary)
    }
}

private struct 🄼axVolumeSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .maxVolume }
    var body: some View {
        🄵lowArrow()
            .foregroundStyle(📱.🔛phase == .fadeOut ? .secondary : .primary)
            .overlay(alignment: .leading) {
                HStack {
                    🄸ndicator(phase: .maxVolume)
                    🄿ercentageLabel(100)
                        .foregroundStyle(self.ⓐctive ? .primary : .tertiary)
                        .fontWeight(self.ⓐctive ? .heavy : nil)
                    🅂peakerIcon(name: "speaker.wave.3")
                        .foregroundStyle(self.ⓐctive ? .primary : .secondary)
                }
                .alignmentGuide(.leading) { $0.width }
            }
            .overlay(alignment: .trailing) {
                Image(systemName: "repeat")
                    .font(.caption.weight(self.ⓐctive ? .heavy : .bold))
                    .foregroundStyle(self.ⓐctive ? .primary : .secondary)
                    .alignmentGuide(.trailing) { _ in -12 }
            }
    }
}

private struct 🅂topAlarmSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool {
        [.waiting, .fadeIn, .maxVolume].contains(📱.🔛phase)
    }
    var body: some View {
        Button {
            switch 📱.🔛phase {
                case .waiting: 📱.🔛phase = .powerOff
                case .fadeIn, .maxVolume: 📱.🔛phase = .fadeOut
                default: break
            }
        } label: {
            Label {
                Text("Stop")
                    .padding(.horizontal, 6)
            } icon: {
                Image(systemName: "checkmark")
            }
            .fontWeight(.bold)
        }
        .tint(.red)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .shadow(radius: self.ⓐctive ? 2 : 0)
        .scaleEffect(self.ⓐctive ? 1 : 0.9)
        .disabled(!self.ⓐctive)
    }
}

private struct 🄵adeOutHourSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓛevel: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    private var ⓘmageName: String {
        switch self.ⓛevel {
            case 80 ... 100: return "speaker.wave.3"
            case 45 ..< 80: return "speaker.wave.2"
            case 10 ..< 45: return "speaker.wave.1"
            case 0 ..< 10: return "speaker"
            default: return "bug"
        }
    }
    private var ⓐctive: Bool { 📱.🔛phase == .fadeOut }
    var body: some View {
        🄵lowArrow()
            .foregroundStyle(self.ⓐctive ? .primary : .secondary)
            .overlay(alignment: .leading) {
                HStack {
                    🄸ndicator(phase: .fadeOut)
                    if self.ⓐctive {
                        🄿ercentageLabel(📱.🔔localVolume)
                            .fontWeight(.heavy)
                            .animation(.default, value: 📱.🔔localVolume)
                    } else {
                        🄿ercentageLabel(self.ⓛevel)
                            .foregroundStyle(.tertiary)
                    }
                    🅂peakerIcon(name: self.ⓘmageName, alignment: .leading)
                        .foregroundStyle(self.ⓐctive ? .primary : .tertiary)
                }
                .alignmentGuide(.leading) { $0.width }
            }
            .overlay(alignment: .trailing) {
                👆FadeOutHourPicker()
                    .foregroundColor(self.ⓐctive ? .primary : nil)
                    .fixedSize()
                    .alignmentGuide(.trailing) { _ in -12 }
            }
            .onReceive(self.ⓣimer) { _ in self.ⓣimerAction() }
    }
    private func ⓣimerAction() {
        guard !self.ⓟause else { return }
        if self.ⓛevel == 0 {
            Task {
                self.ⓟause = true
                try? await Task.sleep(for: .seconds(0.35))
                self.ⓛevel = 100
                self.ⓟause = false
            }
        } else {
            self.ⓛevel -= 1
        }
    }
}
