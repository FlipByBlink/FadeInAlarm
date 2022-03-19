
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    
    @AppStorage(💾Data.🔊VolumeOnWaiting.rawValue) var 🎚🔊VolumeOnWaiting = 3
    
    @State private var 🎚🕰TimeFadeIn = Date() + 180
    
    @AppStorage(💾Data.🕛HourFadein.rawValue) var 🎚🕛HourFadein = 10.0
    
    @AppStorage(💾Data.🕛HourFadeOut.rawValue) var 🎚🕛HourFadeOut = 7.0
    
    
    @State private var 🔛now: 🔛Phase = .powerOff
    
    @State private var 🔔volume: Int = 0
    
    
    let 🎵 = 🎵AlarmPlayer()
    
    
    var body: some View {
        
        ScrollViewReader { 🚡 in
            ScrollView {
                
                VStack {
                    Spacer(minLength: 25)
                    
                    🔊SystemVolume()
                    
                    TimelineView(.periodic(from: .now, by: 1)) { _ in
                        Text(.now, style: .time)
                            .animation(.default)
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                if 🔛now == .powerOff {
                                    🎚🕰TimeFadeIn = Date.now
                                }
                            }
                    }
                    
                    Spacer(minLength: 25)
                    
                    Divider()
                }
                
                
                HStack {
                    Image(systemName: "power.circle") // 􀆨
                        .foregroundColor(.secondary)
                        .font(.largeTitle.weight(.light))
                        .padding()
                    
                    Spacer()
                    
                    if 🔛now ==  .powerOff {
                        Image(systemName: "arrow.down")
                            .font(.largeTitle.weight(.thin))
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal)
                
                
                HStack {
                    🔔(ⓟhase: .waiting, ⓝow: 🔛now, ⓘsSlash: 🎚🔊VolumeOnWaiting == 0 )
                    
                    👆🔊VolumeOnWaiting(ⓢelected: $🎚🔊VolumeOnWaiting)
                        .disabled( 🔛now != .powerOff )
                    
                    if 🔛now == .waiting {
                        🔛Phase.ⓐrrow()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id("🚡start")
                
                
                HStack {
                    👆🕰TimeFadeIn(ⓢelected: $🎚🕰TimeFadeIn)
                        .disabled( 🔛now != .powerOff )
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔(ⓟhase: .fadeIn, ⓝow: 🔛now)
                    
                    👆🕛HourFadeIn(ⓢelected: $🎚🕛HourFadein)
                        .disabled( 🔛now != .powerOff )
                    
                    if 🔛now == .fadeIn {
                        🔛Phase.ⓐrrow()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id("🚡fadeIn")
                
                
                HStack {
                    Text(🎚🕰TimeFadeIn.addingTimeInterval(🎚🕛HourFadein), style: .time)
                        .foregroundColor(.secondary)
                        .padding()
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔(ⓟhase: .maxVolume, ⓝow: 🔛now)
                    
                    if 🔛now == .maxVolume {
                        🔛Phase.ⓐrrow()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id("🚡maxVolume")
                
                
                HStack {
                    Image(systemName: "checkmark.circle") // ✓
                        .font(.largeTitle.weight(.light))
                        .foregroundColor(.secondary)
                        .padding()
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔(ⓟhase: .fadeOut, ⓝow: 🔛now)
                    
                    👆🕛HourFadeOut(ⓢelected: $🎚🕛HourFadeOut)
                        .disabled( 🔛now != .powerOff )
                    
                    if 🔛now == .fadeOut {
                        🔛Phase.ⓐrrow()
                    }
                    
                    Spacer()
                }
                .padding(.bottom)
                .padding(.horizontal)
                .id("🚡fadeOut")
                
                VStack {
                    Divider()
                    
                    📁ImportFile()
                        .disabled( 🔛now != .powerOff )
                    
                    Spacer(minLength: 30)
                    
                    Menu {
                        Link("AppStore link",
                             destination: URL(string: "https://apps.apple.com/app/id1465336070")!)
                        
                        Link("Source code link",
                             destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!)
                    } label: {
                        Image(systemName: "link")
                            .font(.caption)
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            
            .overlay(alignment: .bottom) {
                HStack {
                    Spacer()
                    
                    if 🔛now == .powerOff {
                        🔘Button(type: .start) { // 􀆨
                            🔛now = .waiting
                            
                            withAnimation {
                                🚡.scrollTo("🚡start", anchor: .center)
                            }
                            
                            🎵.play(🎚🕰TimeFadeIn, 🎚🕛HourFadein)
                            
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🕛 in
                                
                                switch 🔛now {
                                case .waiting:
                                    🎵.📻.volume = Float(🎚🔊VolumeOnWaiting) / 100
                                    let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                                    let 🄰larmTime = 🎚🕰TimeFadeIn.formatted(date: .omitted, time: .shortened)
                                    if 🄽ow == 🄰larmTime {
                                        🔛now = .fadeIn
                                        withAnimation {
                                            🚡.scrollTo("🚡fadeIn", anchor: .center)
                                        }
                                    }
                                case .fadeIn:
                                    🎵.📻.volume += Float( 0.5 / 🎚🕛HourFadein )
                                    if 🎵.📻.volume > 1.0 {
                                        🎵.📻.volume = 1.0
                                        🔛now = .maxVolume
                                        withAnimation {
                                            🚡.scrollTo("🚡maxVolume", anchor: .center)
                                        }
                                    }
                                case .maxVolume: break
                                case .fadeOut:
                                    🎵.📻.volume -= Float( 0.5 / 🎚🕛HourFadeOut )
                                    if 🎵.📻.volume < 0.0 {
                                        🎵.📻.volume = 0.0
                                        🔛now = .powerOff
                                    }
                                case .powerOff:
                                    🎵.📻.stop()
                                    MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                                    🕛.invalidate()
                                }
                                
                                🔔volume = Int( 🎵.📻.volume * 100 )
                            }
                            
                            MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                                🔛now = .fadeOut
                                return .success
                            }
                        }
                        .accessibilityLabel("Set alarm")
                        
                    } else {
                        
                        🔘Button(type: .stop) { // ✓
                            if 🔛now == .waiting {
                                🔛now = .powerOff
                            } else {
                                🔛now = .fadeOut
                                withAnimation {
                                    🚡.scrollTo("🚡fadeOut", anchor: .center)
                                }
                            }
                        }
                        .disabled(🔛now == .fadeOut)
                        .tint(.red)
                        .accessibilityLabel("Stop alarm")
                    }
                }
            }
            
            .overlay(alignment: .topTrailing) {
                if 🔛now != .powerOff {
                    ZStack {
                        Label(🔔volume.description + "%", systemImage: "bell")
                            .font(.caption)
                            .opacity(0.9)
                            .foregroundColor(.secondary)
                            .padding()
                        
                        TimelineView(.periodic(from: .now, by: 1)) { _ in
                            if 🎵.📻.isPlaying == false {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.secondary)
                                    .opacity(0.7)
                            }
                        }
                    }
                }
            }
            
            .animation(.default, value: 🔛now)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
