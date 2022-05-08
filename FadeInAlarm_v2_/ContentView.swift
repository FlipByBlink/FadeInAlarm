
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    🪧LocalVolumePercentage(0)
                    
                    Image(systemName: "power.circle") // ⏻
                        .foregroundColor(.secondary)
                        .scaleEffect(1.2)
                        .onTapGesture(count: 2) {
                            📱.🕰TimeFadeIn = Date.now
                        }
                        .accessibilityHidden(true)
                                            
                    if 📱.🔛 == .PowerOff {
                        Image(systemName: "arrow.left") // ←
                            .foregroundStyle(.secondary)
                            .padding(.leading, 4)
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
                    🪧LocalVolumePercentage(📱.🔊VolumeOnWaiting)
                    
                    👆TimeFadeIn()
                }
                
                
                HStack {
                    🪧LocalVolumePercentageFadeIn()
                    
                    🔔IconFadeIn()
                    
                    👆HourFadeIn()
                    
                    if 📱.🔛 == .FadeIn {
                        Image(systemName: "arrow.left") // ←
                    }
                }
                
                
                HStack {
                    🪧LocalVolumePercentage(100)
                    
                    Text(📱.🕰TimeFadeIn.addingTimeInterval(📱.🕛HourFadein), style: .time)
                        .foregroundColor(.secondary)
                        .font(.footnote.weight(.medium))
                }
                
                
                HStack {
                    🪧LocalVolumePercentage(100)
                    
                    🔔IconMaxVolume()
                    
                    Image(systemName: "repeat")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.tertiary)
                    
                    if 📱.🔛 == .MaxVolume {
                        Image(systemName: "arrow.left") // ←
                    }
                }
                
                Divider ()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                
                HStack {
                    🪧LocalVolumePercentage(100)
                    
                    Image(systemName: "checkmark.circle") // ✓
                        .foregroundColor(.secondary)
                        .scaleEffect(1.2)
                }
                
                
                HStack {
                    🪧LocalVolumePercentageFadeOut()
                    
                    🔔IconFadeOut()
                    
                    👆HourFadeOut()
                    
                    if 📱.🔛 == .FadeOut {
                        Image(systemName: "arrow.left") // ←
                    }
                }
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 10)
            .background {
                RoundedRectangle(cornerRadius: 32, style: .continuous)
                    .foregroundColor(Color(.systemBackground))
                    .shadow(radius: 6, x: -2, y: 2)
            }
            .padding(32)
            .frame(maxWidth: 460)
            
            HStack {
                Spacer()
                
                VStack(spacing: 32) {
                    🔊SystemVolume()
                    
                    📁FileName()
                        .font(.title3.weight(.bold))
                    
                    🛠OptionButton()
                }
                .padding()
                .padding(.bottom, 120)
                
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
