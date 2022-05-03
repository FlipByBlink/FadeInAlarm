
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        🪧LocalVolumePercentage("0%")
                        
                        Image(systemName: "power.circle") // ⏻
                            .foregroundColor(.secondary)
                            .font(.body.weight(.light))
                            .onTapGesture(count: 2) {
                                📱.🕰TimeFadeIn = Date.now
                            }
                            .accessibilityHidden(true)
                        
                        if 📱.🔛 == .PowerOff {
                            Image(systemName: "arrow.left") // ←
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    
                    HStack {
                        👆VolumeOnWaiting()
                        
                        🔔IconWaiting()
                        
                        if 📱.🔛 == .Waiting {
                            Image(systemName: "arrow.left") // ←
                        }
                    }
                    
                    
                    HStack {
                        🪧LocalVolumePercentage("0%")
                        
                        👆TimeFadeIn()
                    }
                    
                    
                    HStack {
                        🪧LocalVolumePercentage("60%", .secondary)
                        
                        🔔IconFadeIn()
                        
                        👆HourFadeIn()
                        
                        if 📱.🔛 == .FadeIn {
                            Image(systemName: "arrow.left") // ←
                        }
                    }
                    
                    
                    HStack {
                        🪧LocalVolumePercentage("100%")
                        
                        Text(📱.🕰TimeFadeIn.addingTimeInterval(📱.🕛HourFadein), style: .time)
                            .foregroundColor(.secondary)
                    }
                    
                    
                    HStack {
                        🪧LocalVolumePercentage("100%")
                        
                        🔔IconMaxVolume()
                        
                        Image(systemName: "repeat")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        if 📱.🔛 == .MaxVolume {
                            Image(systemName: "arrow.left") // ←
                        }
                    }
                    
                    Divider ()
                    
                    HStack {
                        🪧LocalVolumePercentage("100%")
                        
                        Image(systemName: "checkmark.circle") // ✓
                            .font(.body.weight(.light))
                            .foregroundColor(.secondary)
                    }
                    
                    
                    HStack {
                        🪧LocalVolumePercentage("33%")
                        
                        🔔IconFadeOut()
                        
                        👆HourFadeOut()
                        
                        if 📱.🔛 == .FadeOut {
                            Image(systemName: "arrow.left") // ←
                        }
                    }
                }
                .padding(24)
                .background {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .foregroundColor(Color(.systemBackground))
                        .shadow(radius: 4)
                }
                .padding(32)
                .frame(maxWidth: 460)
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 32) {
                        🔊SystemVolume()
                        
                        Text("placeholder.mp3") //FIXME: 実装
                            .foregroundStyle(.secondary)
                        
                        🛠Option()
                            .disabled(📱.📻.ⓟlayer.isPlaying)
                    }
                    .padding(.bottom, 36)
                    
                    Spacer()
                }
            }
            
            .animation(.default, value: 📱.🔛)
    }
}




struct ContentView_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        ZStack {
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            
            ContentView()
                .environmentObject(📱)
        }
        .previewLayout(.fixed(width: 350, height: 700))
        
        ZStack {
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            
            ContentView()
                .environmentObject(📱)
        }
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 800, height: 600))
    }
}
