
import SwiftUI


struct 🔔Icon: View {
    
    @EnvironmentObject var 📱: 📱Model
    
    var ⓟhase: 🔛Phase
    
    
    @State private var 🔍 = 0.4
    
    let 🔍OnWaiting = 0.4
    
    
    @State private var 🄾pacity = 1.0
    
    
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
                        Timer.scheduledTimer(withTimeInterval: 1/30, repeats: true) { _ in
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
                        🄵ade()
                        Timer.scheduledTimer(withTimeInterval: 🄳uration, repeats: true) { _ in
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
        .onChange(of: sp) { newValue in
            if newValue == .active {
                🔍 = 0.4
                🄾pacity = 0
            }
        }
    }
    
    
    let 🄳uration = 4.0
    
    func 🄵ade() {
        if ⓟhase == .FadeIn {
            
            🔍 += 0.6/(30*4)
            
            if 🔍 > 0.97 {
                🄾pacity -= 1.0/(30*0.2)
            } else {
                if 🄾pacity < 1.0 {
                    🄾pacity += 1.0/(30*0.2)
                }
            }
            
            if 🔍 >= 1 && 🄾pacity <= 0 {
                🔍 = 0.4
                🄾pacity = 0.0
            }
            
        } else if ⓟhase == .FadeOut {
            🔍 = 1.0
            withAnimation {
                🄾pacity = 1.0
            }
            withAnimation(.linear(duration: 🄳uration)) {
                🔍 = 🔍OnWaiting
            }
            withAnimation(.linear(duration: 0.2).delay( 🄳uration - 0.2 )) {
                🄾pacity = 0.0
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
