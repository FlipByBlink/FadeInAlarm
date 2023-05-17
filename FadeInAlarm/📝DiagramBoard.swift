import SwiftUI

struct 📝DiagramBoard: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                🄿ercentageLabel(0)
                    .foregroundStyle(.tertiary)
                Image(systemName: "power.circle") // ⏻
                    .foregroundColor(.secondary)
                    .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
                    .accessibilityHidden(true)
                Text("Set")
                    .foregroundStyle(.secondary)
                    .font(.caption.weight(.light))
                    .padding(.leading, 8)
            }
            HStack {
                👆WaitingVolumePicker()
                🔈SpeakerIcon(.waiting)
                🄰rrowIndicator(phase: .waiting)
            }
            HStack {
                🄿ercentageLabel(📱.🔊volumeOnWaiting)
                    .foregroundStyle(.tertiary)
                👆FadeInTimePicker()
            }
            🄵adeInHourSection()
            HStack {
                🄿ercentageLabel(100)
                    .foregroundStyle(.tertiary)
                🔈SpeakerIcon(.maxVolume)
                Text(📱.🕰timeFadeIn.addingTimeInterval(📱.🕛hourFadein).formatted(date: .omitted, time: .standard))
                    .foregroundColor(.secondary)
                    .font(.footnote.weight(.light))
            }
            HStack {
                🄿ercentageLabel(100)
                    .foregroundStyle(.tertiary)
                🔈SpeakerIcon(.maxVolume)
                Image(systemName: "repeat")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
                🄰rrowIndicator(phase: .maxVolume)
            }
            Divider ()
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    🄿ercentageLabel(100)
                        .foregroundStyle(.tertiary)
                    Image(systemName: "checkmark.circle") // ✓
                        .foregroundColor(.secondary)
                    Text("Stop")
                        .foregroundStyle(.secondary)
                        .font(.caption.weight(.light))
                        .padding(.leading, 8)
                }
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

private struct 🄵adeInHourSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓛevel: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    var body: some View {
        HStack {
            🄿ercentageLabel(self.ⓛevel)
                .foregroundStyle(.secondary)
            🔈SpeakerIcon(.fadeIn(Double(self.ⓛevel) / 100))
                .animation(.default, value: self.ⓛevel)
            👆FadeInHourPicker()
            🄰rrowIndicator(phase: .fadeIn)
        }
        .onReceive(self.ⓣimer) { _ in
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
}

private struct 🄵adeOutHourSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓛevel: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    var body: some View {
        HStack {
            HStack {
                🄿ercentageLabel(self.ⓛevel)
                    .foregroundStyle(.tertiary)
                🔈SpeakerIcon(.fadeOut(Double(self.ⓛevel) / 100))
                    .animation(.default, value: self.ⓛevel)
            }
            .onReceive(self.ⓣimer) { _ in
                guard !self.ⓟause else { return }
                if self.ⓛevel == 0 {
                    Task {
                        self.ⓟause = true
                        try? await Task.sleep(for: .seconds(0.5))
                        self.ⓛevel = 100
                        self.ⓟause = false
                    }
                } else {
                    self.ⓛevel -= 1
                }
            }
            👆FadeOutHourPicker()
            🄰rrowIndicator(phase: .fadeOut)
        }
    }
}

private struct 🔈SpeakerIcon: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var pattern: Self.Pattern
    private var ⓦorking: Bool {
        📱.🔛phase == {
            switch self.pattern {
                case .waiting: return .waiting
                case .fadeIn(_): return .fadeIn
                case .maxVolume: return .maxVolume
                case .fadeOut(_): return .fadeOut
            }
        }()
    }
    var body: some View {
        Group {
            switch self.pattern {
                case .waiting:
                    Group {
                        if 📱.🔊volumeOnWaiting == 0 {
                            Image(systemName: "speaker")
                        } else {
                            Image(systemName: "speaker.wave.1")
                        }
                    }
                    .foregroundStyle(self.ⓦorking ? .primary : .secondary)
                case .fadeIn(let ⓥariableValue):
                    Image(systemName: "speaker.wave.3", variableValue: ⓥariableValue)
                        .foregroundStyle(self.ⓦorking ? .primary : .secondary)
                case .maxVolume:
                    Image(systemName: "speaker.wave.3")
                        .foregroundStyle(self.ⓦorking ? .primary : .secondary)
                case .fadeOut(let ⓥariableValue):
                    Image(systemName: "speaker.wave.3", variableValue: ⓥariableValue)
                        .foregroundStyle(self.ⓦorking ? .primary : .tertiary)
            }
        }
        .fontWeight(.semibold)
        .animation(.default.speed(2), value: self.ⓦorking)
    }
    init(_ pattern: Self.Pattern) {
        self.pattern = pattern
    }
    enum Pattern {
        case waiting
        case fadeIn(Double)
        case maxVolume
        case fadeOut(Double)
    }
}

private struct 🄰rrowIndicator: View { // ←
    @EnvironmentObject private var 📱: 📱AppModel
    var phase: 🔛Phase
    var body: some View {
        if self.phase == 📱.🔛phase { Image(systemName: "arrow.left") }
    }
}
