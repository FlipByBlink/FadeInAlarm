
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    
    @AppStorage(💾Data.🔊VolumeOnWaiting.rawValue) var 🎚🔊VolumeOnWaiting = 3
    
    @State private var 🎚🕰TimeFadeIn = Date() + 180
    
    @AppStorage(💾Data.🕛HourFadein.rawValue) var 🎚🕛HourFadein = 10.0
    
    @AppStorage(💾Data.🕛HourFadeOut.rawValue) var 🎚🕛HourFadeOut = 3.0
    
    
    @State private var 🔛Now: 🔛Phase = .powerOff
    
    @State private var 🔔Volume: Int = 0
    
    
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
                                if 🔛Now == .powerOff {
                                    🎚🕰TimeFadeIn = Date.now
                                }
                            }
                    }
                    
                    Spacer(minLength: 25)
                    
                    Divider()
                }
                
                
                HStack {
                    Image(systemName: "power.circle") // ⏻
                        .foregroundColor(.secondary)
                        .font(.largeTitle.weight(.light))
                        .padding()
                    
                    Spacer()
                    
                    if 🔛Now ==  .powerOff {
                        Image(systemName: "arrow.down") // ↓
                            .font(.largeTitle.weight(.thin))
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal)
                
                
                HStack {
                    🔔Icon(ⓟhase: .waiting, ⓝow: 🔛Now)
                        .symbolVariant( 🎚🔊VolumeOnWaiting == 0 ? .slash : .none )
                    
                    👆🔊VolumeOnWaiting(ⓢelected: $🎚🔊VolumeOnWaiting)
                        .disabled( 🔛Now != .powerOff )
                    
                    if 🔛Now == .waiting { 🔛Phase.ⓐrrow() }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id("🚡start")
                
                
                HStack {
                    👆🕰TimeFadeIn(ⓢelected: $🎚🕰TimeFadeIn)
                        .disabled( 🔛Now != .powerOff )
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔Icon(ⓟhase: .fadeIn, ⓝow: 🔛Now)
                    
                    👆🕛HourFadeIn(ⓢelected: $🎚🕛HourFadein)
                        .disabled( 🔛Now != .powerOff )
                    
                    if 🔛Now == .fadeIn { 🔛Phase.ⓐrrow() }
                    
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
                    🔔Icon(ⓟhase: .maxVolume, ⓝow: 🔛Now)
                    
                    if 🔛Now == .maxVolume { 🔛Phase.ⓐrrow() }
                    
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
                    🔔Icon(ⓟhase: .fadeOut, ⓝow: 🔛Now)
                    
                    👆🕛HourFadeOut(ⓢelected: $🎚🕛HourFadeOut)
                        .disabled( 🔛Now != .powerOff )
                    
                    if 🔛Now == .fadeOut { 🔛Phase.ⓐrrow() }
                    
                    Spacer()
                }
                .padding(.bottom)
                .padding(.horizontal)
                .id("🚡fadeOut")
                
                
                VStack {
                    Divider()
                    
                    📁ImportFile()
                        .disabled( 🔛Now != .powerOff )
                    
                    Spacer(minLength: 30)
                    
                    Menu {
                        Link("AppStore link",
                             destination: URL(string: "https://apps.apple.com/app/id1465336070")!)
                        
                        Link("Source code link",
                             destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!)
                    } label: {
                        Image(systemName: "link") // 🔗
                            .font(.caption)
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            
            
            .overlay(alignment: .bottom) {
                HStack {
                    Spacer()
                    
                    if 🔛Now == .powerOff {
                        🔘Button(ⓣype: .start) { // ⏻
                            🔛Now = .waiting
                            
                            withAnimation {
                                🚡.scrollTo("🚡start", anchor: .center)
                            }
                            
                            🎵.ⓟlay(🎚🕰TimeFadeIn, 🎚🕛HourFadein)
                            
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🕛 in
                                
                                switch 🔛Now {
                                case .waiting:
                                    🎵.📻.volume = Float(🎚🔊VolumeOnWaiting) / 100
                                    let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                                    let 🄰larmTime = 🎚🕰TimeFadeIn.formatted(date: .omitted, time: .shortened)
                                    if 🄽ow == 🄰larmTime {
                                        🔛Now = .fadeIn
                                        withAnimation {
                                            🚡.scrollTo("🚡fadeIn", anchor: .center)
                                        }
                                    }
                                case .fadeIn:
                                    🎵.📻.volume += Float( 0.5 / 🎚🕛HourFadein )
                                    if 🎵.📻.volume > 1.0 {
                                        🎵.📻.volume = 1.0
                                        🔛Now = .maxVolume
                                        withAnimation {
                                            🚡.scrollTo("🚡maxVolume", anchor: .center)
                                        }
                                    }
                                case .maxVolume: break
                                case .fadeOut:
                                    🎵.📻.volume -= Float( 0.5 / 🎚🕛HourFadeOut )
                                    if 🎵.📻.volume < 0.0 {
                                        🎵.📻.volume = 0.0
                                        🔛Now = .powerOff
                                    }
                                case .powerOff:
                                    🎵.📻.stop()
                                    MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                                    🕛.invalidate()
                                }
                                
                                🔔Volume = Int( 🎵.📻.volume * 100 )
                            }
                            
                            MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                                🔛Now = .fadeOut
                                return .success
                            }
                        }
                        .accessibilityLabel("Set alarm")
                        
                    } else {
                        
                        🔘Button(ⓣype: .stop) { // ✓
                            if 🔛Now == .waiting {
                                🔛Now = .powerOff
                            } else {
                                🔛Now = .fadeOut
                                withAnimation {
                                    🚡.scrollTo("🚡fadeOut", anchor: .center)
                                }
                            }
                        }
                        .disabled(🔛Now == .fadeOut)
                        .tint(.red)
                        .accessibilityLabel("Stop alarm")
                    }
                }
            }
            
            
            .overlay(alignment: .topTrailing) {
                if 🔛Now != .powerOff {
                    ZStack {
                        Label(🔔Volume.description + "%", systemImage: "bell")
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
            
            
            .animation(.default, value: 🔛Now)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
