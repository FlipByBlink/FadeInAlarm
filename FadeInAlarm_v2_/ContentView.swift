
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("0%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        Image(systemName: "power.circle") // ⏻
                            .foregroundColor(.secondary)
                            .font(.body.weight(.light))
                            .onTapGesture(count: 2) {
                                📱.🕰TimeFadeIn = Date.now
                            }
                            .accessibilityHidden(true)
                        
                        if 📱.🔛 == .PowerOff {
                            A⃞rrow() // ←
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    
                    HStack {
                        👆VolumeOnWaiting()
                            .frame(width: 50)
                        
                        🔔IconWaiting()
                        
                        if 📱.🔛 == .Waiting { A⃞rrow() } // ←
                    }
                    
                    
                    HStack {
                        Text("0%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        👆TimeFadeIn()
                    }
                    
                    
                    HStack {
                        Text("50%")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: 50)
                        
                        🔔IconFadeIn()
                        
                        👆HourFadeIn()
                        
                        if 📱.🔛 == .FadeIn { A⃞rrow() } // ←
                    }
                    
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        Text(📱.🕰TimeFadeIn.addingTimeInterval(📱.🕛HourFadein), style: .time)
                            .foregroundColor(.secondary)
                    }
                    
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        🔔IconMaxVolume()
                        
                        Image(systemName: "repeat")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        if 📱.🔛 == .MaxVolume { A⃞rrow() } // ←
                    }
                    
                    Divider ()
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        Image(systemName: "checkmark.circle") // ✓
                            .font(.body.weight(.light))
                            .foregroundColor(.secondary)
                    }
                    
                    
                    HStack {
                        Text("50%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        🔔IconFadeOut()
                        
                        👆HourFadeOut()
                        
                        if 📱.🔛 == .FadeOut { A⃞rrow() } // ←
                    }
                }
                .padding(24)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(Color(.systemBackground))
                        .shadow(radius: 6)
                }
                .padding(32)
                .frame(maxWidth: 450)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        🔊SystemVolume()
                        
                        🛠Option()
                            .padding()
                    }
                    
                    Spacer()
                }
            }
            
            .animation(.default, value: 📱.🔛)
    }
}


struct A⃞rrow: View {
    var body: some View {
        Image(systemName: "arrow.left")
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
