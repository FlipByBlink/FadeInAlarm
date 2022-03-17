
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    
    @State private var 🕰Setted = Date.now + 180
    
    @AppStorage("🕛fadeIn") var 🕛fadeIn: TimeInterval = 30.0
    
    @AppStorage("🕛fadeOut") var 🕛fadeOut: TimeInterval = 7.0
    
    @AppStorage("🔔onWaiting") var 🔔onWaiting: Int = 5
    
    
    @State private var 🔛Now: 🔛Phase = .powerOff
    
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
                                if 🔛Now == .powerOff {
                                    🕰Setted = Date.now
                                }
                            }
                    }
                    
                    Spacer(minLength: 25)
                    
                    Divider()
                    
                    Spacer(minLength: 40)
                    
                    Image(systemName: "power.circle")
                        .foregroundColor(.secondary)
                        .font(.largeTitle.weight(.light))
                        .padding(16)
                        .overlay {
                            if 🔛Now == .powerOff {
                                Image(systemName: "arrow.down")
                                    .font(.title.weight(.thin))
                                    .foregroundColor(.secondary)
                                    .offset(x: -60)
                            }
                        }
                }
                
                
                🔔(ⓟhase: .waiting, ⓝow: 🔛Now, ⓘsSlash: 🔔onWaiting == 0 )
                    .id("🚡start")
                    .overlay {
                        Picker("Volume on waiting", selection: $🔔onWaiting) {
                            Text("0%").tag(0)
                            Text("1%").tag(1)
                            Text("3%").tag(3)
                            Text("5%").tag(5)
                            Text("10%").tag(10)
                        }
                        .pickerStyle(.menu)
                        .offset(x: 40)
                        .labelsHidden()
                        .disabled( 🔛Now != .powerOff )
                        
                        if 🔛Now == .waiting {
                            🔛Phase.arrow()
                        }
                    }
                
                
                DatePicker("", selection: $🕰Setted, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding()
                    .disabled( 🔛Now != .powerOff )
                    .onAppear{
                        if let 🅃ime = UserDefaults.standard.value(forKey: "🕰alarm") {
                            🕰Setted = 🅃ime as! Date
                        } else {
                            🕰Setted = Date.now + 180
                        }
                    }
                    .onChange(of: 🕰Setted) { 🅃ime in
                        UserDefaults.standard.setValue(🅃ime,forKey: "🕰alarm")
                    }
                
                
                🔔(ⓟhase: .fadeIn, ⓝow: 🔛Now)
                    .id("🚡fadeIn")
                    .overlay(alignment: .trailing) {
                        Picker("Hour fade in", selection: $🕛fadeIn) {
                            Text("+ 00:00:10").tag(10.0)
                            Text("+ 00:00:30").tag(30.0)
                            Text("+ 00:01:00").tag(60.0)
                            Text("+ 00:05:00").tag(300.0)
                            Text("+ 00:30:00").tag(1800.0)
                            Text("+ 01:00:00").tag(3600.0)
                        }
                        .pickerStyle(.menu)
                        .offset(x: 90)
                        .labelsHidden()
                        .disabled( 🔛Now != .powerOff )
                        
                        if 🔛Now == .fadeIn {
                            🔛Phase.arrow()
                        }
                    }
                
                
                Text(🕰Setted.addingTimeInterval(🕛fadeIn), style: .time)
                    .foregroundColor(.secondary)
                    .padding()
                
                
                🔔(ⓟhase: .maxVolume, ⓝow: 🔛Now)
                    .id("🚡maxVolume")
                    .overlay {
                        if 🔛Now == .maxVolume {
                            🔛Phase.arrow()
                        }
                    }
                
                
                Image(systemName: "checkmark.circle")
                    .font(.largeTitle.weight(.light))
                    .foregroundColor(.secondary)
                    .padding(16)
                
                
                🔔(ⓟhase: .fadeOut, ⓝow: 🔛Now)
                    .id("🚡fadeOut")
                    
                    .overlay(alignment: .trailing) {
                        Picker("Hour fade out", selection: $🕛fadeOut) {
                            Text("+ 00:00:03").tag(3.0)
                            Text("+ 00:00:07").tag(7.0)
                            Text("+ 00:00:15").tag(15.0)
                            Text("+ 00:00:30").tag(30.0)
                            Text("+ 00:01:00").tag(60.0)
                        }
                        .pickerStyle(.menu)
                        .offset(x: 90)
                        .labelsHidden()
                        .disabled( 🔛Now != .powerOff )
                        
                        if 🔛Now == .fadeOut {
                            🔛Phase.arrow()
                        }
                    }
                
                
                VStack {
                    Spacer(minLength: 60)
                    
                    Divider()
                    
                    📁ImportFile()
                        .disabled( 🔛Now != .powerOff )
                    
                    Group {
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                        
                        Link("AppStore link",
                             destination: URL(string: "https://apps.apple.com/app/id1465336070")!)
                        
                        Link("Source code link",
                             destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!)
                    }
                    .padding(1)
                    .font(.footnote)
                    
                    Spacer(minLength: 170)
                }
            }
            
            .overlay(alignment: .bottom) {
                HStack {
                    if 🔛Now == .powerOff {
                        🔘Button(type: .start) { // 􀆨
                            🔛Now = .waiting
                            
                            withAnimation {
                                🚡.scrollTo("🚡start", anchor: .center)
                            }
                            
                            🎵.play(🕰Setted, 🕛fadeIn)
                            
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🕛 in
                                
                                switch 🔛Now {
                                case .waiting:
                                    🎵.📻.volume = Float(🔔onWaiting) / 100
                                    let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                                    let 🄰larmTime = 🕰Setted.formatted(date: .omitted, time: .shortened)
                                    if 🄽ow == 🄰larmTime {
                                        🔛Now = .fadeIn
                                        withAnimation {
                                            🚡.scrollTo("🚡fadeIn", anchor: .center)
                                        }
                                    }
                                case .fadeIn:
                                    🎵.📻.volume += Float( 0.5 / 🕛fadeIn )
                                    if 🎵.📻.volume > 1.0 {
                                        🎵.📻.volume = 1.0
                                        🔛Now = .maxVolume
                                        withAnimation {
                                            🚡.scrollTo("🚡maxVolume", anchor: .center)
                                        }
                                    }
                                case .maxVolume: break
                                case .fadeOut:
                                    🎵.📻.volume -= Float( 0.5 / 🕛fadeOut )
                                    if 🎵.📻.volume < 0.0 {
                                        🎵.📻.volume = 0.0
                                        🔛Now = .powerOff
                                    }
                                case .powerOff:
                                    🎵.📻.stop()
                                    MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                                    🕛.invalidate()
                                }
                                
                                🔔volume = Int( 🎵.📻.volume * 100 )
                            }
                            
                            MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                                🔛Now = .fadeOut
                                return .success
                            }
                        }
                        .accessibilityLabel("Set alarm")
                        
                    } else {
                        
                        🔘Button(type: .stop) { // ✓
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
                        .foregroundColor( 🔛Now.beforeStart() ? nil : .red )
                        .accessibilityLabel("Stop alarm")
                    }

                    Spacer()
                }
            }
            
            .overlay(alignment: .topTrailing) {
                if 🔛Now != .powerOff {
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
            
            .animation(.default, value: 🔛Now)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
