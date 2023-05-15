import SwiftUI

struct 🔔Icon: View {
    @EnvironmentObject private var 📱: 📱AppModel
    private var ⓟhase: 🔛Phase
    var body: some View {
        Image(systemName: "bell")
            .font(.body.bold())
            .symbolVariant(📱.🔛phase == self.ⓟhase ? .fill : .none)
            .foregroundColor(📱.🔛phase == self.ⓟhase ? nil : .secondary)
    }
    init(_ phase: 🔛Phase) {
        self.ⓟhase = phase
    }
}

// Scale on waiting: 0.4
// Animation duration: 4
// Frame per second: 30
// Opacity transition duration: 0.35

struct 🔔IconWaiting: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        🔔Icon(.waiting)
            .scaleEffect(0.4)
            .symbolVariant(📱.🔊volumeOnWaiting == 0 ? .slash : .none)
    }
}

struct 🔔IconFadeIn: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓞpacity = 0.0
    var body: some View {
        🔔Icon(.fadeIn)
            .scaleEffect(📱.🪧LVP🔍FadeIn)
            .opacity(self.ⓞpacity)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1 / 30 , repeats: true) { _ in
                    📱.🪧LVP🔍FadeIn += (1 - 0.4) / (30 * 4)
                    if 📱.🪧LVP🔍FadeIn > 1.0 - (1 / 30) * 0.35 {
                        self.ⓞpacity -= 1.0 / (30 * 0.35)
                    } else {
                        if self.ⓞpacity < 1.0 {
                            self.ⓞpacity += 1.0 / (30 * 0.35)
                        }
                    }
                    if 📱.🪧LVP🔍FadeIn >= 1 && self.ⓞpacity <= 0 {
                        📱.🪧LVP🔍FadeIn = 0.4
                    }
                }
            }
    }
}

struct 🔔IconMaxVolume: View {
    var body: some View {
        🔔Icon(.maxVolume)
    }
}

struct 🔔IconFadeOut: View {
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var ⓞpacity = 0.0
    var body: some View {
        🔔Icon(.fadeOut)
            .scaleEffect(📱.🪧LVP🔍FadeOut)
            .opacity(self.ⓞpacity)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1 / 30 , repeats: true) { _ in
                    📱.🪧LVP🔍FadeOut -= (1 - 0.4) / (30 * 4)
                    if 📱.🪧LVP🔍FadeOut < 0.4 + (1 / 30) * 0.35 {
                        self.ⓞpacity -= 1.0 / (30 * 0.35)
                    } else {
                        if self.ⓞpacity < 1.0 {
                            self.ⓞpacity += 1.0 / (30 * 0.35)
                        }
                    }
                    if 📱.🪧LVP🔍FadeOut <= 0.4 && self.ⓞpacity <= 0 {
                        📱.🪧LVP🔍FadeOut = 1.0
                    }
                }
            }
    }
}
