import SwiftUI

struct 📝DiagramBoard: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                🪧LocalVolumePercentage(0)
                Image(systemName: "power.circle") // ⏻
                    .foregroundColor(.secondary)
                    .scaleEffect(1.2)
                    .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
                    .accessibilityHidden(true)
                Text("Set")
                    .foregroundStyle(.secondary)
                    .font(.caption.weight(.medium))
                    .padding(.leading, 2)
            }
            HStack {
                👆WaitingVolumePicker()
                🔈SpeakerIcon(.waiting)
                🄰rrowIndicator(phase: .waiting)
            }
            HStack {
                🪧LocalVolumePercentage(📱.🔊volumeOnWaiting)
                👆FadeInTimePicker()
            }
            🄵adeInHourSection()
            HStack {
                🪧LocalVolumePercentage(100)
                🔈SpeakerIcon(.maxVolume)
                Text(📱.🕰timeFadeIn.addingTimeInterval(📱.🕛hourFadein).formatted(date: .omitted, time: .standard))
                    .foregroundColor(.secondary)
                    .font(.footnote.weight(.light))
            }
            HStack {
                🪧LocalVolumePercentage(100)
                🔈SpeakerIcon(.maxVolume)
                Image(systemName: "repeat")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
                🄰rrowIndicator(phase: .maxVolume)
            }
            Divider ()
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    🪧LocalVolumePercentage(100)
                    Image(systemName: "checkmark.circle") // ✓
                        .foregroundColor(.secondary)
                        .scaleEffect(1.2)
                    Text("Stop")
                        .foregroundStyle(.secondary)
                        .font(.caption.weight(.medium))
                        .padding(.leading, 2)
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

private struct 🄵adeInHourSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓛevel: Int = 0
    @State private var ⓟause: Bool = false
    private let 🕒timer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    var body: some View {
        HStack {
            🪧LocalVolumePercentage(self.ⓛevel, .secondary)
            🔈SpeakerIcon(.fadeIn(Double(self.ⓛevel) / 100))
                .animation(.default, value: self.ⓛevel)
            👆FadeInHourPicker()
            🄰rrowIndicator(phase: .fadeIn)
        }
        .onReceive(self.🕒timer) { _ in
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
    private let 🕒timer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    var body: some View {
        HStack {
            HStack {
                🪧LocalVolumePercentage(self.ⓛevel)
                🔈SpeakerIcon(.fadeOut(Double(self.ⓛevel) / 100))
                    .animation(.default, value: self.ⓛevel)
            }
            .onReceive(self.🕒timer) { _ in
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
