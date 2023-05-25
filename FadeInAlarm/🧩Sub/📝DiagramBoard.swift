import SwiftUI

struct 📝DiagramBoard: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @ScaledMetric private var ⓦidth = 360.0
    var body: some View {
        ScrollViewReader { 🚡 in
            VStack(spacing: 0) {
                VStack(spacing: 8) {
                    🅂etAlarmSection()
                    🅆aitingSection()
                    🅂tartFadeInSection()
                    🄳uringFadeInSection()
                        .id(🔛Phase.fadeIn)
                    🄴ndFadeInSection()
                    🄼axVolumeSection()
                        .id(🔛Phase.maxVolume)
                }
                .padding(24)
                Divider()
                VStack(spacing: 8) {
                    🅂topAlarmSection()
                    🄵adeOutHourSection()
                        .id(🔛Phase.fadeOut)
                }
                .padding(16)
            }
            .onChange(of: 📱.🔛phase) { ⓝewValue in
                withAnimation { 🚡.scrollTo(ⓝewValue) }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.background)
                .shadow(radius: 3)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: self.ⓦidth)
        .animation(.default, value: 📱.🔛phase)
        .dynamicTypeSize(..<DynamicTypeSize.accessibility2)
    }
}

private struct 🄿ercentageLabel: View {
    private var ⓥalue: Int
    var body: some View {
        ZStack(alignment: .trailing) {
            Self.baseFrame()
            Text("\(self.ⓥalue) %")
                .font(.caption.monospacedDigit())
                .fontWeight(.semibold)
                .fixedSize()
        }
    }
    static func baseFrame() -> some View {
        Text("100 %")
            .font(.caption.monospacedDigit())
            .fontWeight(.semibold)
            .fixedSize()
            .opacity(0)
    }
    init(_ value: Int) {
        self.ⓥalue = value
    }
}

private struct 🅂peakerIcon: View {
    var name: String
    var body: some View {
        ZStack(alignment: .leading) {
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
        }
    }
}

private struct 🄵lowArrow: View {
    var body: some View {
        Text("⇣")
            .font(.largeTitle.bold())
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
        .padding(.top, 2)
    }
}

private struct 🅆aitingSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .waiting }
    private var ⓐrrowStyle: HierarchicalShapeStyle {
        [.fadeIn, .maxVolume, .fadeOut].contains(📱.🔛phase) ? .secondary : .primary
    }
    var body: some View {
        🄵lowArrow()
            .foregroundStyle(self.ⓐrrowStyle)
            .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
            .accessibilityHidden(true)
            .overlay(alignment: .leading) {
                HStack {
                    🄸ndicator(phase: .waiting)
                    ZStack(alignment: .trailing) {
                        🄿ercentageLabel.baseFrame()
                        👆WaitingVolumePicker()
                            .foregroundColor(self.ⓐctive ? .primary : nil)
                    }
                    🅂peakerIcon(name: 📱.🔊volumeOnWaiting == 0 ? "speaker" : "speaker.wave.1")
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
    @State private var ⓟercentage: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    private var ⓦaveValue: Int { Int(Double(self.ⓟercentage) / 34) + 1 }
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
                        🄿ercentageLabel(self.ⓟercentage)
                            .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
                    }
                    🅂peakerIcon(name: "speaker.wave.\(self.ⓦaveValue)")
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
        if self.ⓟercentage == 100 {
            Task {
                self.ⓟause = true
                try? await Task.sleep(for: .seconds(0.35))
                self.ⓟercentage = 📱.🔊volumeOnWaiting
                self.ⓟause = false
            }
        } else {
            self.ⓟercentage += 1
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
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
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
        .padding(.top, 2)
    }
}

private struct 🄵adeOutHourSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓟercentage: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    private var ⓢpeakerImageName: String {
        switch self.ⓟercentage {
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
                        🄿ercentageLabel(self.ⓟercentage)
                            .foregroundStyle(.tertiary)
                    }
                    🅂peakerIcon(name: self.ⓢpeakerImageName)
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
        if self.ⓟercentage == 0 {
            Task {
                self.ⓟause = true
                try? await Task.sleep(for: .seconds(0.35))
                self.ⓟercentage = 100
                self.ⓟause = false
            }
        } else {
            self.ⓟercentage -= 1
        }
    }
}
