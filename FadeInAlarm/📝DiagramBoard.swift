import SwiftUI

struct 📝DiagramBoard: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                🄿ercentageLabel(0)
                    .foregroundStyle(.tertiary)
                🄸con(name: "power.circle") // ⏻
                    .foregroundColor(.secondary)
                    .onTapGesture(count: 2) { 📱.🕰timeFadeIn = .now }
                    .accessibilityHidden(true)
                Text("Set")
                    .foregroundStyle(.secondary)
                    .font(.caption.weight(.light))
            }
            HStack {
                👆WaitingVolumePicker()
                🄸con(name: 📱.🔊volumeOnWaiting == 0 ? "speaker" : "speaker.wave.1",
                      alignment: .leading)
                .foregroundStyle(📱.🔛phase == .waiting ? .primary : .secondary)
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
                🄸con(name: "speaker.wave.3")
                    .foregroundStyle(.secondary)
                Text(📱.🕰timeFadeIn.addingTimeInterval(📱.🕛hourFadein).formatted(date: .omitted, time: .standard))
                    .foregroundColor(.secondary)
                    .font(.footnote.weight(.light))
            }
            HStack {
                🄿ercentageLabel(100)
                    .foregroundStyle(.tertiary)
                🄸con(name: "speaker.wave.3")
                    .foregroundStyle(📱.🔛phase == .maxVolume ? .primary : .secondary)
                Image(systemName: "repeat")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(📱.🔛phase == .maxVolume ? .primary : .tertiary)
                🄰rrowIndicator(phase: .maxVolume)
            }
            Divider ()
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    🄿ercentageLabel(100)
                        .foregroundStyle(.tertiary)
                    🄸con(name: "checkmark.circle")
                        .foregroundColor(.secondary)
                    Text("Stop")
                        .foregroundStyle(.secondary)
                        .font(.caption.weight(.light))
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

private struct 🄸con: View {
    var name: String
    var alignment: Alignment = .center
    var body: some View {
        ZStack(alignment: self.alignment) {
            self.ⓑaseFrame()
            Image(systemName: self.name)
        }
        .fontWeight(.medium)
    }
    private func ⓑaseFrame() -> some View {
        Image(systemName: "speaker.wave.3").opacity(0)
    }
}

private struct 🄵adeInHourSection: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓛevel: Int = 0
    @State private var ⓟause: Bool = false
    private let ⓣimer = Timer.publish(every: 1 / 30, on: .main, in: .default).autoconnect()
    private var ⓦaveValue: Int { Int(Double(self.ⓛevel) / 34) + 1 }
    var body: some View {
        HStack {
            🄿ercentageLabel(self.ⓛevel)
                .foregroundStyle(.secondary)
            🄸con(name: "speaker.wave.\(self.ⓦaveValue)", alignment: .leading)
                .foregroundStyle(📱.🔛phase == .fadeIn ? .primary : .secondary)
            👆FadeInHourPicker()
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
    var body: some View {
        HStack {
            🄿ercentageLabel(self.ⓛevel)
                .foregroundStyle(.tertiary)
            🄸con(name: self.ⓘmageName, alignment: .leading)
                .foregroundStyle(📱.🔛phase == .fadeOut ? .primary : .tertiary)
            👆FadeOutHourPicker()
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

private struct 🄰rrowIndicator: View { // ←
    @EnvironmentObject private var 📱: 📱AppModel
    var phase: 🔛Phase
    var body: some View {
        if self.phase == 📱.🔛phase { Image(systemName: "arrow.left") }
    }
}
