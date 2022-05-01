
import SwiftUI
import AVFAudio
import MediaPlayer


struct ContentView: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    
    var body: some View {
        ScrollViewReader { 🚡 in
            ScrollView {
                HStack {
                    Image(systemName: "power.circle") // ⏻
                        .foregroundColor(.secondary)
                        .font(.title.weight(.light))
                        .padding()
                        .padding(.leading, 32)
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
                .padding(.top, 80)
                
                
                HStack {
//                    🔔Icon(.Waiting)
                    IconWainting()
                    
                    👆VolumeOnWaiting()
                    
                    if 📱.🔛 == .Waiting { A⃞rrow() } // ←
                    
                    Spacer()
                }
                .id(🔛Phase.Waiting)
                
                
                HStack {
                    👆TimeFadeIn()
                    
                    Spacer()
                }
                
                
                HStack {
//                    🔔Icon(.FadeIn)
                    IconFadeIn()
                    
                    👆HourFadeIn()
                    
                    if 📱.🔛 == .FadeIn { A⃞rrow() } // ←
                    
                    Spacer()
                }
                .id(🔛Phase.FadeIn)
                
                
                HStack {
                    Text(📱.🕰TimeFadeIn.addingTimeInterval(📱.🕛HourFadein), style: .time)
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .padding()
                        .padding(.leading, 28)
                    
                    Spacer()
                }
                
                
                HStack {
//                    🔔Icon(.MaxVolume)
                    IconMaxVolume()
                    
                    if 📱.🔛 == .MaxVolume { A⃞rrow() } // ←
                    
                    Spacer()
                }
                .id(🔛Phase.MaxVolume)
                
                
                HStack {
                    Image(systemName: "checkmark.circle") // ✓
                        .font(.title.weight(.light))
                        .foregroundColor(.secondary)
                        .padding()
                        .padding(.leading, 32)
                    
                    Spacer()
                }
                
                
                HStack {
//                    🔔Icon(.FadeOut)
                    IconFadeOut()
                    
                    👆HourFadeOut()
                    
                    if 📱.🔛 == .FadeOut { A⃞rrow() } // ←
                    
                    Spacer()
                }
                .id(🔛Phase.FadeOut)
                
                
                VStack {
                    Divider()
                        .padding(.top, 56)
                    
                    📁ImportFile()
                        .disabled( 📱.🔛 != .PowerOff )
                    
                    Spacer(minLength: 12)
                    
                    🔗Link()
                        .disabled( 📱.🔛 != .PowerOff )
                    
                    Spacer(minLength: 100)
                }
            }
            
            
            .overlay(alignment: .bottomTrailing) {
                🔘Button(🚡) // ⏻ ✓
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
            .font(.title)
            .padding()
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
