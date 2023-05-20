import SwiftUI

struct 📝DiagramBoard: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            🅂etAlarmSection()
            🅆aitingSection()
            🅂tartFadeInSection()
            🄳uringFadeInSection()
            🄴ndFadeInSection()
            🄼axVolumeSection()
            Divider()
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            VStack(alignment: .leading, spacing: 12) {
                🅂topAlarmSection()
                🄵adeOutHourSection()
            }
        }
        .overlay(alignment: .topTrailing) {
            Image(systemName: "arrow.down")
                .font(.title.weight(.black))
                .foregroundStyle(.quaternary)
                .offset(x: -16)
        }
        .padding(.vertical, 28)
        .padding(.horizontal, 10)
        .background {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .foregroundColor(Color(uiColor: .systemBackground))
                .shadow(radius: 4)
        }
        .padding(.top, 32)
        .padding(.horizontal, 32)
        .frame(maxWidth: 460)
        .animation(.default, value: 📱.🔛phase)
    }
}

private struct 🄿ercentageLabel: View {
    private var ⓥalue: Int
    var body: some View {
        Text("\(self.ⓥalue) %")
            .font(.caption.monospacedDigit())
            .frame(width: 54, alignment: .trailing)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
    }
    init(_ value: Int) {
        self.ⓥalue = value
    }
}

private struct 🄸con: View {
    var name: String
    var alignment: Alignment = .center
    var body: some View {
        ZStack(alignment: self.alignment) {
            self.ⓑaseFrame()
            Image(systemName: self.name)
        }
        .fontWeight(.medium)
        .padding(.horizontal, 4)
    }
    private func ⓑaseFrame() -> some View {
        Image(systemName: "speaker.wave.3").opacity(0)
    }
}

private struct 🄰rrowIndicator: View { // ←
    @EnvironmentObject private var 📱: 📱AppModel
    var phase: 🔛Phase
    var body: some View {
        if self.phase == 📱.🔛phase {
            Image(systemName: "arrow.left")
                .fontWeight(.semibold)
                .padding(.leading, 4)
        }
    }
}

private struct 🅂etAlarmSection: View { // ⏻
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .powerOff }
    var body: some View {
        HStack {
            🄿ercentageLabel(0)
                .foregroundStyle(.tertiary)
                .opacity(0)
            Button {
                📱.startAlarm()
            } label: {
                Label {
                    Text("Set")
                        .padding(.horizontal, 6)
                } icon: {
                    Image(systemName: "power")
                }
                .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .shadow(radius: self.ⓐctive ? 2 : 0)
            .disabled(!self.ⓐctive)
        }
    }
}

private struct 🅆aitingSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .waiting }
    var body: some View {
        HStack {
            👆WaitingVolumePicker()
                .foregroundColor(self.ⓐctive ? .primary : nil)
            🄸con(name: 📱.🔊volumeOnWaiting == 0 ? "speaker" : "speaker.wave.1",
                  alignment: .leading)
            .foregroundStyle(self.ⓐctive ? .primary : .secondary)
            🄰rrowIndicator(phase: .waiting)
        }
    }
}

private struct 🅂tartFadeInSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        HStack {
            🄿ercentageLabel(📱.🔊volumeOnWaiting)
                .foregroundStyle(.tertiary)
                .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
            🄸con(name: 📱.🔊volumeOnWaiting == 0 ? "speaker" : "speaker.wave.1",
                  alignment: .leading)
            .foregroundStyle(.secondary)
            👆FadeInTimePicker()
        }
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
        HStack {
            if self.ⓐctive {
                🄿ercentageLabel(📱.🔔localVolume)
                    .fontWeight(.heavy)
                    .animation(.default, value: 📱.🔔localVolume)
            } else {
                🄿ercentageLabel(self.ⓛevel)
                    .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
            }
            🄸con(name: "speaker.wave.\(self.ⓦaveValue)", alignment: .leading)
                .foregroundStyle(self.ⓐctive ? .primary : .secondary)
            👆FadeInHourPicker()
                .foregroundColor(self.ⓐctive ? .primary : nil)
            🄰rrowIndicator(phase: .fadeIn)
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
        HStack {
            🄿ercentageLabel(100)
                .foregroundStyle(.tertiary)
            🄸con(name: "speaker.wave.3")
                .foregroundStyle(.secondary)
            Text(self.ⓣimeLabel)
                .foregroundColor(.secondary)
                .font(.caption2.weight(.light).italic())
        }
    }
}

private struct 🄼axVolumeSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool { 📱.🔛phase == .maxVolume }
    var body: some View {
        HStack {
            🄿ercentageLabel(100)
                .foregroundStyle(self.ⓐctive ? .primary : .tertiary)
                .fontWeight(self.ⓐctive ? .heavy : nil)
            🄸con(name: "speaker.wave.3")
                .foregroundStyle(self.ⓐctive ? .primary : .secondary)
            Image(systemName: "repeat")
                .font(.caption.weight(self.ⓐctive ? .heavy : .semibold))
                .foregroundStyle(self.ⓐctive ? .primary : .tertiary)
            🄰rrowIndicator(phase: .maxVolume)
                .padding(.leading, 4)
        }
    }
}

private struct 🅂topAlarmSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓐctive: Bool {
        [.waiting, .fadeIn, .maxVolume].contains(📱.🔛phase)
    }
    var body: some View {
        HStack {
            🄿ercentageLabel(0)
                .foregroundStyle(.tertiary)
                .opacity(0)
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
            .disabled(!self.ⓐctive)
        }
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
        HStack {
            if self.ⓐctive {
                🄿ercentageLabel(📱.🔔localVolume)
                    .fontWeight(.heavy)
                    .animation(.default, value: 📱.🔔localVolume)
            } else {
                🄿ercentageLabel(self.ⓛevel)
                    .foregroundStyle(.tertiary)
            }
            🄸con(name: self.ⓘmageName, alignment: .leading)
                .foregroundStyle(self.ⓐctive ? .primary : .tertiary)
            👆FadeOutHourPicker()
                .foregroundColor(self.ⓐctive ? .primary : nil)
            🄰rrowIndicator(phase: .fadeOut)
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
