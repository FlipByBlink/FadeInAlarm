
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    
    @State private var 🕰alarm = Date.now + 180
    
    @AppStorage("🕛fadeIn") var 🕛fadeIn: TimeInterval = 30.0
    
    @AppStorage("🕛fadeOut") var 🕛fadeOut: TimeInterval = 7.0
    
    @AppStorage("🔔onWaiting") var 🔔onWaiting: Int = 5
    
    
    @State private var 🔛: 🔛Phase = .powerOff
    
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
                                if 🔛 == .powerOff {
                                    🕰alarm = Date.now
                                }
                            }
                    }
                    
                    Spacer(minLength: 25)
                    
                    Divider()
                    
                    Spacer(minLength: 40)
                    
                    Image(systemName: "power.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 72))
                        .padding()
                        .overlay {
                            Image(systemName: "arrow.down")
                                .font(.system(size: 50).weight(.semibold))
                                .opacity(0.1)
                                .offset(x: -120, y: 0)
                        }
                    
                }
                
                
                🔔(phase: .waiting,isSlash: 🔔onWaiting == 0 )
                    .foregroundColor( 🔛 == .waiting ? nil : .secondary)
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
                        .disabled( 🔛 != .powerOff )
                        
                        if 🔛 == .waiting {
                            🔛Phase.arrow()
                        }
                    }
                
                
                DatePicker("", selection: $🕰alarm, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .padding()
                    .disabled( 🔛 != .powerOff )
                    .onAppear{
                        if let 🅃ime = UserDefaults.standard.value(forKey: "🕰alarm") {
                            🕰alarm = 🅃ime as! Date
                        } else {
                            🕰alarm = Date.now + 180
                        }
                    }
                    .onChange(of: 🕰alarm) { 🅃ime in
                        UserDefaults.standard.setValue(🅃ime,forKey: "🕰alarm")
                    }
                
                
                🔔(phase: .fadeIn)
                    .foregroundColor( 🔛 == .fadeIn ? nil : .secondary)
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
                        .disabled( 🔛 != .powerOff )
                        
                        if 🔛 == .fadeIn {
                            🔛Phase.arrow()
                        }
                    }
                
                
                Text(🕰alarm.addingTimeInterval(🕛fadeIn), style: .time)
                    .foregroundColor(.secondary)
                    .padding()
                
                
                🔔(phase: .maxVolume)
                    .foregroundColor( 🔛 == .maxVolume ? nil : .secondary)
                    .id("🚡maxVolume")
                    .overlay {
                        if 🔛 == .maxVolume {
                            🔛Phase.arrow()
                        }
                    }
                
                
                Image(systemName: "checkmark.circle.fill")
                    .symbolRenderingMode(SwiftUI.SymbolRenderingMode.hierarchical)
                    .font(.system(size: 72))
                    .scaleEffect(0.8)
                    .foregroundColor(.secondary)
                    .padding()
                
                
                🔔(phase: .fadeOut)
                    .foregroundColor( 🔛 == .fadeOut ? nil : .secondary)
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
                        .disabled( 🔛 != .powerOff )
                        
                        if 🔛 == .fadeOut {
                            🔛Phase.arrow()
                        }
                    }
                
                
                VStack {
                    Spacer(minLength: 60)
                    
                    Divider()
                    
                    📁ImportFile()
                        .disabled( 🔛 != .powerOff )
                    
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
            
            /*
            .overlay(alignment: .bottom) {
                HStack {
                    
                    Spacer()
                    
                    🔘Button(type: .start) {
                        🔛 = .waiting
                        
                        withAnimation {
                            🚡.scrollTo("🚡start", anchor: .center)
                        }
                        
                        🎵.play(🕰alarm, 🕛fadeIn)
                        
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🕛 in
                            
                            switch 🔛 {
                            case .waiting:
                                🎵.📻.volume = Float(🔔onWaiting) / 100
                                let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                                let 🄰larmTime = 🕰alarm.formatted(date: .omitted, time: .shortened)
                                if 🄽ow == 🄰larmTime {
                                    🔛 = .fadeIn
                                    withAnimation {
                                        🚡.scrollTo("🚡fadeIn", anchor: .center)
                                    }
                                }
                            case .fadeIn:
                                🎵.📻.volume += Float( 0.5 / 🕛fadeIn )
                                if 🎵.📻.volume > 1.0 {
                                    🎵.📻.volume = 1.0
                                    🔛 = .maxVolume
                                    withAnimation {
                                        🚡.scrollTo("🚡maxVolume", anchor: .center)
                                    }
                                }
                            case .maxVolume: break
                            case .fadeOut:
                                🎵.📻.volume -= Float( 0.5 / 🕛fadeOut )
                                if 🎵.📻.volume < 0.0 {
                                    🎵.📻.volume = 0.0
                                    🔛 = .powerOff
                                }
                            case .powerOff:
                                🎵.📻.stop()
                                MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                                🕛.invalidate()
                            }
                            
                            🔔volume = Int( 🎵.📻.volume * 100 )
                        }
                        
                        MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                            🔛 = .fadeOut
                            return .success
                        }
                    }
                    .disabled( 🔛 != .powerOff )
                    .accessibilityLabel("Set alarm")
                    
                    
//                    Spacer()
                    
                    
//                    🔘Button(type: .stop) {
//                        if 🔛 == .waiting {
//                            🔛 = .powerOff
//                        } else {
//                            🔛 = .fadeOut
//                            withAnimation {
//                                🚡.scrollTo("🚡fadeOut", anchor: .center)
//                            }
//                        }
//                    }
//                    .disabled(🔛.beforeStart())
//                    .foregroundColor( 🔛.beforeStart() ? nil : .red )
//                    .accessibilityLabel("Stop alarm")
                }
            }
             */
            
            .overlay(alignment: .topTrailing) {
                if 🔛 != .powerOff {
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
            
            .animation(.default, value: 🔛)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}

