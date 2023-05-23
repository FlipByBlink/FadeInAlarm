import SwiftUI

struct 💁GuideTab: View {
    var body: some View {
        NavigationStack {
            List {
                🄵lowSection()
                🄽oteSection()
            }
            .navigationTitle("Guide")
        }
    }
}

private struct 🄵lowSection: View {
    private let ⓢteps: [Int: LocalizedStringKey] = [
        1: "When the user presses the \"Set\" button, the app starts playing an alarm sound in very low volume.",
        2: "The application will continue to play the alarm sound repeatedly until the user presses the stop button.",
        3: "At the alarm time, the volume will gradually increase, reaching its full volume after a user-specified time interval (10 seconds - 1 hour).",
        4: "When the \"Stop\" button is pressed, the volume will gradually decrease at user-specified intervals (3 seconds - 1 minute). When the sound is completely silent, the app stops playing the alarm."
    ]
    var body: some View {
        Section {
            ForEach(1 ... 4, id: \.self) { ⓘndex in
                Label {
                    Text(self.ⓢteps[ⓘndex]!)
                } icon: {
                    Text("\(ⓘndex).")
                }
            }
        } header: {
            Text("Operation flow")
        }
    }
}

private struct 🄽oteSection: View {
    var body: some View {
        Section {
            Label("Need to prepare a sound file", systemImage: "music.note")
            Text("""
            Please import sound source files (mp3, etc) prepared by myself. The preset sound data is for testing purposes.
            """)
            .padding(.horizontal, 12)
        }
        Section {
            Label {
                Text("This app is more inconvenient than ordinary alarm apps.")
            } icon: {
                Text("😱")
                    .font(.title3)
            }
            Text("""
            For various reasons, this app differs from ordinary alarm apps in that it cannot sound an alarm when the app itself is not running at all. You need to start the app beforehand.
            """)
            .padding(.horizontal, 12)
            Text("""
            For example, if you want to use this app at 6:00 a.m. for alarm purposes, please launch this app just before going to bed and press \"Set\" button.
            """)
            .font(.caption)
            .padding(.horizontal, 12)
        }
        Section {
            Label("There are limitations while in waiting phase", systemImage: "exclamationmark.triangle")
            Text("""
            While in waiting phase, you can lock the device or use other apps, but you need to be a little careful not to interrupt the alarm waiting state.
            """)
            .padding(.horizontal, 12)
            Group {
                Text("""
                __The following situations will interrupt the alarm waiting state__
                ・Situations where you watch long videos in other app
                ・Playing a song on the music app
                """)
                Text("""
                __The alarm waiting state will be interrupted in the following situations, but will resume automatically__
                ・When using the camera app
                ・Situations in which some kind of system notification generates an audible alarm
                """)
            }
            .font(.caption)
            .padding(.horizontal, 12)
        }
    }
}
