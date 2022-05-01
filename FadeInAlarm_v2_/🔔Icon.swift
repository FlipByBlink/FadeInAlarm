
import SwiftUI


struct 🔔Icon: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var ⓟhase: 🔛Phase
    
    
    @State private var 🔍 = 0.4
    
    let 🔍OnWaiting = 0.4
    
    
    @State private var 🄾pacity = 0.0
    
    
    @Environment(\.scenePhase) var sp: ScenePhase
    
    
    var body: some View {
        Group {
            switch ⓟhase {
            case .Waiting:
                Image(systemName: "bell")
                    .scaleEffect(🔍OnWaiting)
                    .symbolVariant( 📱.🔊VolumeOnWaiting == 0 ? .slash : .none )
                
            case .FadeIn:
                Image(systemName: "bell")
                    .scaleEffect(🔍)
                    .opacity(🄾pacity)
                    .task {
                        Timer.scheduledTimer(withTimeInterval: 1/PerSec, repeats: true) { _ in
                            🄵ade()
                        }
                    }
                
            case .MaxVolume:
                Image(systemName: "bell")
                
            case .FadeOut:
                Image(systemName: "bell")
                    .scaleEffect(🔍)
                    .opacity(🄾pacity)
                    .task {
                        Timer.scheduledTimer(withTimeInterval: 1/PerSec, repeats: true) { _ in
                            🄵ade()
                        }
                    }
                
            case .PowerOff: Text("👿")
            }
        }
        .symbolVariant( 📱.🔛 == ⓟhase ? .fill : .none)
        .foregroundColor( 📱.🔛 == ⓟhase ? nil : .secondary)
        .padding()
        .padding(.leading, 32)
        .font(.title)
    }
    
    let PerSec = 30.0
    let Sec = 4.0
    let transitionHour = 0.35
    
    func 🄵ade() {
        
        if ⓟhase == .FadeIn {
            
            🔍 += ( 1 - 🔍OnWaiting ) / ( PerSec * Sec )
            
            if 🔍 > 1.0 - ( 1 / PerSec ) * transitionHour {
                🄾pacity -= 1.0 / ( PerSec * transitionHour )
            } else {
                if 🄾pacity < 1.0 {
                    🄾pacity += 1.0 / ( PerSec * transitionHour )
                }
            }
            
            if 🔍 >= 1 && 🄾pacity <= 0 {
                🔍 = 🔍OnWaiting
            }
            
        } else if ⓟhase == .FadeOut {
            🔍 -= ( 1 - 🔍OnWaiting ) / ( PerSec * Sec )
            
            if 🔍 < 🔍OnWaiting + ( 1 / PerSec ) * transitionHour {
                🄾pacity -= 1.0 / ( PerSec * transitionHour )
            } else {
                if 🄾pacity < 1.0 {
                    🄾pacity += 1.0 / ( PerSec * transitionHour )
                }
            }
            
            if 🔍 <= 🔍OnWaiting && 🄾pacity <= 0 {
                🔍 = 1.0
            }
        }
    }
    
    init(_ ⓟhase: 🔛Phase) {
        self.ⓟhase = ⓟhase
    }
}




struct 🔔Icon_Previews: PreviewProvider {
    
    static let 📱 = 📱Model()
    
    static var previews: some View {
        
        VStack {
            🔔Icon(.Waiting)
            🔔Icon(.FadeIn)
            🔔Icon(.MaxVolume)
            🔔Icon(.FadeOut)
        }
        .environmentObject(📱)
    }
}
