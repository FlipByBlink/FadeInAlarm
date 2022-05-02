
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
                            .frame(width: 40)
                        
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
                            .frame(width: 40)
                        
                        🔔IconWaiting()
                        
                        if 📱.🔛 == .Waiting { A⃞rrow() } // ←
                        
                        Spacer()
                    }
                    .id(🔛Phase.Waiting)
                    
                    
                    HStack {
                        Text("0%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 40)
                        
                        👆TimeFadeIn()
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("50%")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: 40)
                        
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
                            .frame(width: 40)
                        
                        Text(📱.🕰TimeFadeIn.addingTimeInterval(📱.🕛HourFadein), style: .time)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 40)
                        
                        🔔IconMaxVolume()
                        
                        if 📱.🔛 == .MaxVolume { A⃞rrow() } // ←
                        
                        Spacer()
                    }
                    .id(🔛Phase.MaxVolume)
                    
                    Divider ()
                    
                    HStack {
                        Text("100%")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .frame(width: 40)
                        
                        Image(systemName: "checkmark.circle") // ✓
                            .font(.body.weight(.light))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    
                    
                    HStack {
                        Text("50%")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: 40)
                        
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
                .padding(.vertical, 64)
            }
            .background {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
            }
            
            
            .overlay(alignment: .bottomTrailing) {
                HStack(alignment: .bottom) {
                    🛠Option()
                        .padding(8)
                    
                    🔘Button(🚡) // ⏻ ✓
                }
                .padding()
            }
            
            
            .overlay(alignment: .topTrailing) {
                VStack(alignment: .trailing) {
                    🔊SystemVolume()
                    
                    🔊LocalVolume()
                }
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
        ContentView()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 350, height: 700))
        
        ContentView()
            .environmentObject(📱)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 800, height: 600))
    }
}
