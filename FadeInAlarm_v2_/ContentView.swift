
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    
    @AppStorage(💾Data.VolumeOnWaiting.rawValue) var 🔊VolumeOnWaiting = 3
    
    @State private var 🕰TimeFadeIn = Date() + 180
    
    @AppStorage(💾Data.HourFadein.rawValue) var 🕛HourFadein = 10.0
    
    @AppStorage(💾Data.HourFadeOut.rawValue) var 🕛HourFadeOut = 3.0
    
    
    @State private var 🔛: 🔛Phase = .PowerOff
    
    @State private var 🔔Volume: Int = 0
    
    
    let 📻 = 📻AlarmPlayer()
    
    
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
                                if 🔛 == .PowerOff {
                                    🕰TimeFadeIn = Date.now
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
                    
                    if 🔛 ==  .PowerOff {
                        Image(systemName: "arrow.down") // ↓
                            .font(.largeTitle.weight(.thin))
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal)
                
                
                HStack {
                    🔔Icon(ⓟhase: .Waiting, ⓝow: 🔛)
                        .symbolVariant( 🔊VolumeOnWaiting == 0 ? .slash : .none )
                    
                    👆🔊VolumeOnWaiting(ⓢelected: $🔊VolumeOnWaiting)
                        .disabled( 🔛 != .PowerOff )
                    
                    if 🔛 == .Waiting { 🔛Phase.ⓐrrow() }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id(🔛Phase.Waiting)
                
                
                HStack {
                    👆🕰TimeFadeIn(ⓢelected: $🕰TimeFadeIn)
                        .disabled( 🔛 != .PowerOff )
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔Icon(ⓟhase: .FadeIn, ⓝow: 🔛)
                    
                    👆🕛HourFadeIn(ⓢelected: $🕛HourFadein)
                        .disabled( 🔛 != .PowerOff )
                    
                    if 🔛 == .FadeIn { 🔛Phase.ⓐrrow() }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id(🔛Phase.FadeIn)
                
                
                HStack {
                    Text(🕰TimeFadeIn.addingTimeInterval(🕛HourFadein), style: .time)
                        .foregroundColor(.secondary)
                        .padding()
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔Icon(ⓟhase: .MaxVolume, ⓝow: 🔛)
                    
                    if 🔛 == .MaxVolume { 🔛Phase.ⓐrrow() }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .id(🔛Phase.MaxVolume)
                
                
                HStack {
                    Image(systemName: "checkmark.circle") // ✓
                        .font(.largeTitle.weight(.light))
                        .foregroundColor(.secondary)
                        .padding()
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                
                HStack {
                    🔔Icon(ⓟhase: .FadeOut, ⓝow: 🔛)
                    
                    👆🕛HourFadeOut(ⓢelected: $🕛HourFadeOut)
                        .disabled( 🔛 != .PowerOff )
                    
                    if 🔛 == .FadeOut { 🔛Phase.ⓐrrow() }
                    
                    Spacer()
                }
                .padding(.bottom)
                .padding(.horizontal)
                .id(🔛Phase.FadeOut)
                
                
                VStack {
                    Divider()
                    
                    📁ImportFile()
                        .disabled( 🔛 != .PowerOff )
                    
                    Spacer(minLength: 30)
                    
                    Menu {
                        Link("AppStore link",
                             destination: URL(string: "https://apps.apple.com/app/id1465336070")!)
                        
                        Link("Source code link",
                             destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!)
                    } label: {
                        Image(systemName: "link") // 🔗
                    }
                    
                    Spacer(minLength: 100)
                }
            }
            
            
            .overlay(alignment: .bottom) {
                HStack {
                    Spacer()
                    
                    if 🔛 == .PowerOff {
                        🔘Button(ⓣype: .Start) { // ⏻
                            🔛 = .Waiting
                            
                            withAnimation {
                                🚡.scrollTo(🔛Phase.Waiting, anchor: .center)
                            }
                            
                            📻.ⓟlay(🕰TimeFadeIn, 🕛HourFadein)
                            
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🕛 in
                                
                                switch 🔛 {
                                case .Waiting:
                                    📻.ⓟlayer.volume = Float(🔊VolumeOnWaiting) / 100
                                    let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                                    let 🄰larmTime = 🕰TimeFadeIn.formatted(date: .omitted, time: .shortened)
                                    if 🄽ow == 🄰larmTime {
                                        🔛 = .FadeIn
                                        withAnimation {
                                            🚡.scrollTo(🔛Phase.FadeIn, anchor: .center)
                                        }
                                    }
                                case .FadeIn:
                                    📻.ⓟlayer.volume += Float( 0.5 / 🕛HourFadein )
                                    if 📻.ⓟlayer.volume > 1.0 {
                                        📻.ⓟlayer.volume = 1.0
                                        🔛 = .MaxVolume
                                        withAnimation {
                                            🚡.scrollTo(🔛Phase.MaxVolume, anchor: .center)
                                        }
                                    }
                                case .MaxVolume: break
                                case .FadeOut:
                                    📻.ⓟlayer.volume -= Float( 0.5 / 🕛HourFadeOut )
                                    if 📻.ⓟlayer.volume < 0.0 {
                                        📻.ⓟlayer.volume = 0.0
                                        🔛 = .PowerOff
                                    }
                                case .PowerOff:
                                    📻.ⓟlayer.stop()
                                    MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                                    🕛.invalidate()
                                }
                                
                                🔔Volume = Int( 📻.ⓟlayer.volume * 100 )
                            }
                            
                            MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                                🔛 = .FadeOut
                                return .success
                            }
                        }
                        .accessibilityLabel("Set alarm")
                        
                    } else {
                        
                        🔘Button(ⓣype: .Stop) { // ✓
                            if 🔛 == .Waiting {
                                🔛 = .PowerOff
                            } else {
                                🔛 = .FadeOut
                                withAnimation {
                                    🚡.scrollTo(🔛Phase.FadeOut, anchor: .center)
                                }
                            }
                        }
                        .disabled(🔛 == .FadeOut)
                        .tint(.red)
                        .accessibilityLabel("Stop alarm")
                    }
                }
            }
            
            
            .overlay(alignment: .topTrailing) {
                if 🔛 != .PowerOff {
                    ZStack {
                        Label( 🔔Volume.description + "%" , systemImage: "bell")
                            .font(.caption)
                            .opacity(0.9)
                            .foregroundColor(.secondary)
                            .padding()
                        
                        TimelineView(.periodic(from: .now, by: 1)) { _ in
                            if 📻.ⓟlayer.isPlaying == false {
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.secondary)
                                    .opacity(0.7)
                            }
                        }
                    }
                }
            }
            
            
            .animation(.default, value: 🔛)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
