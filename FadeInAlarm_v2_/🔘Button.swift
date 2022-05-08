
import SwiftUI
import MediaPlayer


struct 🔘Button: View {
    
    @EnvironmentObject var 📱: 📱Model
    
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
                
                📱.📻.ⓟlay(📱.🕰TimeFadeIn, 📱.🕛HourFadein)
                
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { 🤖 in
                    
                    switch 📱.🔛 {
                    case .Waiting:
                        📱.📻.ⓟlayer.volume = Float(📱.🔊VolumeOnWaiting) / 100
                        let 🄽ow = Date.now.formatted(date: .omitted, time: .shortened)
                        let 🄰larmTime = 📱.🕰TimeFadeIn.formatted(date: .omitted, time: .shortened)
                        if 🄽ow == 🄰larmTime {
                            📱.🔛 = .FadeIn
                        }
                        
                    case .FadeIn:
                        📱.📻.ⓟlayer.volume += Float( 0.5 / 📱.🕛HourFadein )
                        if 📱.📻.ⓟlayer.volume > 1.0 {
                            📱.📻.ⓟlayer.volume = 1.0
                            📱.🔛 = .MaxVolume
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
                }
            }
        } label: {
            Image(systemName: 🖼Name)
                .font(.system(size: 96))
                .symbolRenderingMode(.palette)
                .foregroundStyle(Color(.systemBackground), 🎨)
                .shadow(radius: 4, x: -2, y: 2)
        }
        .padding()
        .disabled(📱.🔛 == .FadeOut)
        .opacity(📱.🔛 == .FadeOut ? 0.6 : 1.0)
        .accessibilityLabel(📱.🔛 == .PowerOff ? "Set alarm" : "Stop alarm")
        .animation(.default, value: 📱.🔛)
    }
}




struct 🔘Button_Previews: PreviewProvider {
    static let 📱PowerOff: 📱Model = {
        let a = 📱Model()
        a.🔛 = .PowerOff
        return a
    }()
    
    static let 📱MaxVolume: 📱Model = {
        let a = 📱Model()
        a.🔛 = .MaxVolume
        return a
    }()
    
    static let 📱FadeOut: 📱Model = {
        let a = 📱Model()
        a.🔛 = .FadeOut
        return a
    }()
    
    static var previews: some View {
        VStack {
            🔘Button()
                .environmentObject(📱PowerOff)
            
            🔘Button()
                .environmentObject(📱MaxVolume)
            
            🔘Button()
                .environmentObject(📱FadeOut)
        }
        .previewLayout(.fixed(width: 300, height: 500))
        
        VStack {
            🔘Button()
                .environmentObject(📱PowerOff)
            
            🔘Button()
                .environmentObject(📱MaxVolume)
            
            🔘Button()
                .environmentObject(📱FadeOut)
        }
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 300, height: 500))
    }
}
