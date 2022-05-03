
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    
    var body: some View {
        ScrollViewReader { 🚡 in
            ScrollView {
                VStack(spacing: 16) {
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
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        👆VolumeOnWaiting()
                            .frame(width: 50)
                        
                        🔔IconWaiting()
                        
                        if 📱.🔛 == .Waiting { A⃞rrow() } // ←
                        
                        Spacer()
                    }
                    .id(🔛Phase.Waiting)
                    
                    
                    HStack {
                        Text("0%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        👆TimeFadeIn()
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("50%")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: 50)
                        
                        🔔IconFadeIn()
                        
                        👆HourFadeIn()
                        
                        if 📱.🔛 == .FadeIn { A⃞rrow() } // ←
                        
                        Spacer()
                    }
                    .id(🔛Phase.FadeIn)
                    
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        Text(📱.🕰TimeFadeIn.addingTimeInterval(📱.🕛HourFadein), style: .time)
                            .foregroundColor(.secondary)
                        
                        Spacer()
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
                        
                        Spacer()
                    }
                    .id(🔛Phase.MaxVolume)
                    
                    Divider ()
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        Image(systemName: "checkmark.circle") // ✓
                            .font(.body.weight(.light))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("50%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 50)
                        
                        🔔IconFadeOut()
                        
                        👆HourFadeOut()
                        
                        if 📱.🔛 == .FadeOut { A⃞rrow() } // ←
                        
                        Spacer()
                    }
                    .id(🔛Phase.FadeOut)
                }
                .padding(24)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(Color(.systemBackground))
                        .shadow(radius: 6)
                }
                .padding(32)
                .frame(maxWidth: 500)
                
                🔊SystemVolume()
                
                🛠Option()
            }
            
            
            .overlay(alignment: .bottomTrailing) {
                HStack(alignment: .bottom) {
                    🔊LocalVolume()
                    
                    🔘Button(🚡) // ⏻ ✓
                }
                .padding()
            }
            
            
            .animation(.default, value: 📱.🔛)
        }
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
