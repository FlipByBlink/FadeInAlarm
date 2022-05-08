
import SwiftUI


struct 🔔Icon: View {
    @EnvironmentObject var 📱: 📱Model
    
    var ⓟhase: 🔛Phase
    
    var body: some View {
        Image(systemName: "bell")
            .font(.body.bold())
            .symbolVariant( 📱.🔛 == ⓟhase ? .fill : .none)
            .foregroundColor( 📱.🔛 == ⓟhase ? nil : .secondary)
    }
    
    init(_ ⓟhase: 🔛Phase) {
        self.ⓟhase = ⓟhase
    }
}


// Scale on waiting: 0.4
// Animation duration: 4
// Frame per second: 30
// Opacity transition duration: 0.35


struct 🔔IconWaiting: View {
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        🔔Icon(.Waiting)
            .scaleEffect(0.4)
            .symbolVariant( 📱.🔊VolumeOnWaiting == 0 ? .slash : .none )
    }
}


struct 🔔IconFadeIn: View {
    @EnvironmentObject var 📱: 📱Model
    
    @State private var 🄾pacity = 0.0
    
    var body: some View {
        🔔Icon(.FadeIn)
            .scaleEffect(📱.🪧LVP🔍FadeIn)
            .opacity(🄾pacity)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1 / 30 , repeats: true) { _ in
                    📱.🪧LVP🔍FadeIn += ( 1 - 0.4 ) / ( 30 * 4 )
                    
                    if 📱.🪧LVP🔍FadeIn > 1.0 - ( 1 / 30 ) * 0.35 {
                        🄾pacity -= 1.0 / ( 30 * 0.35 )
                    } else {
                        if 🄾pacity < 1.0 {
                            🄾pacity += 1.0 / ( 30 * 0.35 )
                        }
                    }
                    
                    if 📱.🪧LVP🔍FadeIn >= 1 && 🄾pacity <= 0 {
                        📱.🪧LVP🔍FadeIn = 0.4
                    }
                }
            }
            
    }
}


struct 🔔IconMaxVolume: View {
    var body: some View {
        🔔Icon(.MaxVolume)
    }
}



struct 🔔IconFadeOut: View {
    @EnvironmentObject var 📱: 📱Model
    
    @State private var 🄾pacity = 0.0
    
    var body: some View {
        🔔Icon(.FadeOut)
            .scaleEffect(📱.🪧LVP🔍FadeOut)
            .opacity(🄾pacity)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1 / 30 , repeats: true) { _ in
                    📱.🪧LVP🔍FadeOut -= ( 1 - 0.4 ) / ( 30 * 4 )
                    
                    if 📱.🪧LVP🔍FadeOut < 0.4 + ( 1 / 30 ) * 0.35 {
                        🄾pacity -= 1.0 / ( 30 * 0.35 )
                    } else {
                        if 🄾pacity < 1.0 {
                            🄾pacity += 1.0 / ( 30 * 0.35 )
                        }
                    }
                    
                    if 📱.🪧LVP🔍FadeOut <= 0.4 && 🄾pacity <= 0 {
                        📱.🪧LVP🔍FadeOut = 1.0
                    }
                }
            }
        
    }
}




struct 🔔Icon_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        VStack {
            🔔IconWaiting()
            🔔IconFadeIn()
            🔔IconMaxVolume()
            🔔IconFadeOut()
        }
        .environmentObject(📱)
    }
}
