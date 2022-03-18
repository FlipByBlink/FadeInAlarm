
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    
    @State private var 🕰setted = Date.now + 180
    
    @AppStorage("🕛fadeIn") var 🕛fadeIn: TimeInterval = 30.0
    
    @AppStorage("🕛fadeOut") var 🕛fadeOut: TimeInterval = 7.0
    
    @AppStorage("🔔onWaiting") var 🔔onWaiting: Int = 5
    
    
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
                                    🕰setted = Date.now
                                }
                            }
                    }
                    
                    Spacer(minLength: 25)
                    
                    Divider()
                }
                
                
                VStack {
                    HStack {
                        Image(systemName: "power.circle")
                            .foregroundColor(.secondary)
                            .font(.largeTitle.weight(.light))
                            .padding()
                        
                        Spacer()

                        Image(systemName: "arrow.down")
                            .font(.largeTitle.weight(.thin))
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    
                    
                    HStack {
                        🔔(ⓟhase: .waiting, ⓝow: 🔛now, ⓘsSlash: 🔔onWaiting == 0 )
                        
                        Picker("Volume on waiting", selection: $🔔onWaiting) {
                            Text("0%").tag(0)
                            Text("1%").tag(1)
                            Text("3%").tag(3)
                            Text("5%").tag(5)
                            Text("10%").tag(10)
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .disabled( 🔛now != .powerOff )
                        
                        Spacer()
                    }
                    .id("🚡start")
                    
                    
                    HStack {
                        DatePicker("", selection: $🕰setted, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .padding()
                            .disabled( 🔛now != .powerOff )
                            .onAppear{
                                if let 🅃ime = UserDefaults.standard.value(forKey: "🕰alarm") {
                                    🕰setted = 🅃ime as! Date
                                } else {
                                    🕰setted = Date.now + 180
                                }
                            }
                            .onChange(of: 🕰setted) { 🅃ime in
                                UserDefaults.standard.setValue(🅃ime,forKey: "🕰alarm")
                            }
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        🔔(ⓟhase: .fadeIn, ⓝow: 🔛now)
                        
                        Picker("Hour fade in", selection: $🕛fadeIn) {
                            Text("+ 00:00:10").tag(10.0)
                            Text("+ 00:00:30").tag(30.0)
                            Text("+ 00:01:00").tag(60.0)
                            Text("+ 00:05:00").tag(300.0)
                            Text("+ 00:30:00").tag(1800.0)
                            Text("+ 01:00:00").tag(3600.0)
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .disabled( 🔛now != .powerOff )
                        
                        Spacer()
                    }
                    .id("🚡fadeIn")
                    
                    
                    HStack {
                        Text(🕰setted.addingTimeInterval(🕛fadeIn), style: .time)
                            .foregroundColor(.secondary)
                            .padding()
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        🔔(ⓟhase: .maxVolume, ⓝow: 🔛now)
                        
                        Spacer()
                    }
                    .id("🚡maxVolume")

                    
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .font(.largeTitle.weight(.light))
                            .foregroundColor(.secondary)
                            .padding()
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        🔔(ⓟhase: .fadeOut, ⓝow: 🔛now)
                        
                        Picker("Hour fade out", selection: $🕛fadeOut) {
                            Text("+ 00:00:03").tag(3.0)
                            Text("+ 00:00:07").tag(7.0)
                            Text("+ 00:00:15").tag(15.0)
                            Text("+ 00:00:30").tag(30.0)
                            Text("+ 00:01:00").tag(60.0)
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        .disabled( 🔛now != .powerOff )
                        
                        Spacer()
                    }
                    .id("🚡fadeOut")
                }
                .padding()
                
                VStack {
                    Divider()
                    
                    📁ImportFile()
                        .disabled( 🔛now != .powerOff )
                    
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
                    
                    Spacer(minLength: 150)
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
                            
                            🎵.play(🕰setted, 🕛fadeIn)
                            
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🕛 in
                                
                                switch 🔛now {
                                case .waiting:
                                    🎵.📻.volume = Float(🔔onWaiting) / 100
                                    let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                                    let 🄰larmTime = 🕰setted.formatted(date: .omitted, time: .shortened)
                                    if 🄽ow == 🄰larmTime {
                                        🔛now = .fadeIn
                                        withAnimation {
                                            🚡.scrollTo("🚡fadeIn", anchor: .center)
                                        }
                                    }
                                case .fadeIn:
                                    🎵.📻.volume += Float( 0.5 / 🕛fadeIn )
                                    if 🎵.📻.volume > 1.0 {
                                        🎵.📻.volume = 1.0
                                        🔛now = .maxVolume
                                        withAnimation {
                                            🚡.scrollTo("🚡maxVolume", anchor: .center)
                                        }
                                    }
                                case .maxVolume: break
                                case .fadeOut:
                                    🎵.📻.volume -= Float( 0.5 / 🕛fadeOut )
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
                        .foregroundColor( 🔛now.beforeStart() ? nil : .red )
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
