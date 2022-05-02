
import SwiftUI
import MediaPlayer


struct 🔘Button: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var 🚡: ScrollViewProxy
    
    var 🎨: Color {
        switch 📱.🔛 {
        case .Waiting: return .red
        case .FadeIn: return .red
        case .MaxVolume: return .red
        case .FadeOut: return .gray
        case .PowerOff: return .accentColor
        }
    }
    
    var 🖼Name: String {
        📱.🔛 == .PowerOff ? "power.circle.fill" : "checkmark.circle.fill"
    }
    
    var body: some View {
        Button {
            if 📱.🔛 == .PowerOff { // ⏻
                📱.🔛 = .Waiting
                
                withAnimation {
                    🚡.scrollTo(🔛Phase.Waiting, anchor: .center)
                }
                
                📱.📻.ⓟlay(📱.🕰TimeFadeIn, 📱.🕛HourFadein)
                
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🤖 in
                    
                    switch 📱.🔛 {
                    case .Waiting:
                        📱.📻.ⓟlayer.volume = Float(📱.🔊VolumeOnWaiting) / 100
                        let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                        let 🄰larmTime = 📱.🕰TimeFadeIn.formatted(date: .omitted, time: .shortened)
                        if 🄽ow == 🄰larmTime {
                            📱.🔛 = .FadeIn
                            withAnimation {
                                🚡.scrollTo(🔛Phase.FadeIn, anchor: .center)
                            }
                        }
                        
                    case .FadeIn:
                        📱.📻.ⓟlayer.volume += Float( 0.5 / 📱.🕛HourFadein )
                        if 📱.📻.ⓟlayer.volume > 1.0 {
                            📱.📻.ⓟlayer.volume = 1.0
                            📱.🔛 = .MaxVolume
                            withAnimation {
                                🚡.scrollTo(🔛Phase.MaxVolume, anchor: .center)
                            }
                        }
                        
                    case .MaxVolume: break
                        
                    case .FadeOut:
                        📱.📻.ⓟlayer.volume -= Float( 0.5 / 📱.🕛HourFadeOut )
                        if 📱.📻.ⓟlayer.volume < 0.0 {
                            📱.📻.ⓟlayer.volume = 0.0
                            📱.🔛 = .PowerOff
                        }
                        
                    case .PowerOff:
                        📱.📻.ⓟlayer.stop()
                        MPRemoteCommandCenter.shared().stopCommand.removeTarget(nil)
                        🤖.invalidate()
                    }
                    
                    📱.🔔Volume = Int( 📱.📻.ⓟlayer.volume * 100 )
                }
                
                MPRemoteCommandCenter.shared().stopCommand.addTarget { _ in
                    📱.🔛 = .FadeOut
                    return .success
                }
                
            } else { // ✓
                if 📱.🔛 == .Waiting {
                    📱.🔛 = .PowerOff
                } else {
                    📱.🔛 = .FadeOut
                    withAnimation {
                        🚡.scrollTo(🔛Phase.FadeOut, anchor: .center)
                    }
                }
            }
        } label: {
            Image(systemName: 🖼Name)
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(.systemBackground), 🎨)
                .shadow(radius: 4,
                        x: 1, y: 1.5)
        }
        .disabled(📱.🔛 == .FadeOut)
        .opacity(📱.🔛 == .FadeOut ? 0.6 : 1.0)
        .accessibilityLabel(📱.🔛 == .PowerOff ? "Set alarm" : "Stop alarm")
    }
    
    init(_ 🚡: ScrollViewProxy) {
        self.🚡 = 🚡
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static let 📱p:📱Model = {
        let a = 📱Model()
        a.🔛 = .PowerOff
        return a
    }()
    
    static let 📱m:📱Model = {
        let a = 📱Model()
        a.🔛 = .MaxVolume
        return a
    }()
    
    static let 📱f:📱Model = {
        let a = 📱Model()
        a.🔛 = .FadeOut
        return a
    }()
    
    static var previews: some View {
        ScrollViewReader { b in
            VStack {
                🔘Button(b)
                    .environmentObject(📱p)
                
                🔘Button(b)
                    .environmentObject(📱m)
                
                🔘Button(b)
                    .environmentObject(📱f)
            }
        }
        .previewLayout(.fixed(width: 300, height: 500))
        
        ScrollViewReader { b in
            VStack {
                🔘Button(b)
                    .environmentObject(📱p)
                
                🔘Button(b)
                    .environmentObject(📱m)
                
                🔘Button(b)
                    .environmentObject(📱f)
            }
            .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 300, height: 500))
    }
}
