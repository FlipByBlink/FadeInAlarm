
import SwiftUI


struct 🔔Icon: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var ⓟhase: 🔛Phase
    
    
    @State private var 🔍 = 0.4
    
    let 🔍OnWaiting = 0.4
    
    @State private var 🄾pacity = 0.0
    
    
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
                        Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { _ in
                            🔍 += ( 1 - 🔍OnWaiting ) / ( 30 * 4 )
                            
                            if 🔍 > 1.0 - ( 1 / 30 ) * 0.35 {
                                🄾pacity -= 1.0 / ( 30 * 0.35 )
                            } else {
                                if 🄾pacity < 1.0 {
                                    🄾pacity += 1.0 / ( 30 * 0.35 )
                                }
                            }
                            
                            if 🔍 >= 1 && 🄾pacity <= 0 {
                                🔍 = 🔍OnWaiting
                            }
                        }
                    }
                
            case .MaxVolume:
                Image(systemName: "bell")
                
            case .FadeOut:
                Image(systemName: "bell")
                    .scaleEffect(🔍)
                    .opacity(🄾pacity)
                    .task {
                        Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { _ in
                            🔍 -= ( 1 - 🔍OnWaiting ) / ( 30 * 4 )
                            
                            if 🔍 < 🔍OnWaiting + ( 1 / 30 ) * 0.35 {
                                🄾pacity -= 1.0 / ( 30 * 0.35 )
                            } else {
                                if 🄾pacity < 1.0 {
                                    🄾pacity += 1.0 / ( 30 * 0.35 )
                                }
                            }
                            
                            if 🔍 <= 🔍OnWaiting && 🄾pacity <= 0 {
                                🔍 = 1.0
                            }
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
    
//    let PerSec = 30.0
//    let Sec = 4.0
//    let transitionHour = 0.35
    
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
