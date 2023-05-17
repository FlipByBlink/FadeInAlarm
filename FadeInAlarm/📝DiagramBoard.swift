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
                self.ⓟhaseIndicator(.powerOff)
                    .foregroundStyle(.secondary)
                    .padding(.leading, 4)
            }
            HStack {
                👆WaitingVolumePicker()
                🔔IconWaiting()
                self.ⓟhaseIndicator(.waiting)
            }
            HStack {
                🪧LocalVolumePercentage(📱.🔊volumeOnWaiting)
                👆FadeInTimePicker()
            }
            HStack {
                🪧LocalVolumePercentageFadeIn()
                🔔IconFadeIn()
                👆FadeInHourPicker()
                self.ⓟhaseIndicator(.fadeIn)
            }
            HStack {
                🪧LocalVolumePercentage(100)
                Text(📱.🕰timeFadeIn.addingTimeInterval(📱.🕛hourFadein), style: .time)
                    .foregroundColor(.secondary)
                    .font(.footnote.weight(.medium))
            }
            HStack {
                🪧LocalVolumePercentage(100)
                🔔IconMaxVolume()
                Image(systemName: "repeat")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
                self.ⓟhaseIndicator(.maxVolume)
            }
            Divider ()
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            HStack {
                🪧LocalVolumePercentage(100)
                Image(systemName: "checkmark.circle") // ✓
                    .foregroundColor(.secondary)
                    .scaleEffect(1.2)
            }
            HStack {
                🪧LocalVolumePercentageFadeOut()
                🔔IconFadeOut()
                👆FadeOutHourPicker()
                self.ⓟhaseIndicator(.fadeOut)
            }
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
    }
    private func ⓟhaseIndicator(_ ⓟhase: 🔛Phase) -> some View { // ←
        Group { if 📱.🔛phase == ⓟhase { Image(systemName: "arrow.left") } }
    }
}
