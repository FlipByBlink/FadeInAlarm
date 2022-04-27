
import SwiftUI


struct 🔔Icon: View {
    
    var ⓟhase: 🔛Phase
    
    var ⓝow: 🔛Phase
    
    
    @State private var 🔍 = 0.4
    
    let 🔍OnWaiting = 0.4
    
    
    @State private var 🄾pacity = 1.0
    
    
    var body: some View {
        Group {
            switch ⓟhase {
            case .Waiting:
                Image(systemName: "bell")
                    .scaleEffect(🔍OnWaiting)
                
            case .FadeIn:
                Image(systemName: "bell")
                    .scaleEffect(🔍)
                    .task {
                        🄵ade()
                        Timer.scheduledTimer(withTimeInterval: 🄳uration, repeats: true) { _ in
                            🄵ade()
                        }
                    }
                
            case .MaxVolume:
                Image(systemName: "bell")
                
            case .FadeOut:
                Image(systemName: "bell")
                    .scaleEffect(🔍)
                    .task {
                        🄵ade()
                        Timer.scheduledTimer(withTimeInterval: 🄳uration, repeats: true) { _ in
                            🄵ade()
                        }
                    }
                
            case .PowerOff: Text("👿")
            }
        }
        .symbolVariant( ⓝow == ⓟhase ? .fill : .none)
        .foregroundColor( ⓝow == ⓟhase ? nil : .secondary)
        .opacity(🄾pacity)
        .padding()
        .padding(.leading, 32)
        .font(.title)
    }
    
    
    let 🄳uration = 4.0
    
    func 🄵ade() {
        if ⓟhase == .FadeIn {
            🔍 = 🔍OnWaiting
            withAnimation {
                🄾pacity = 1.0
            }
            withAnimation(.linear(duration: 🄳uration)) {
                🔍 = 1.0
            }
            withAnimation(.linear(duration: 0.2).delay( 🄳uration - 0.2 )) {
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
}




struct 🔔Icon_Previews: PreviewProvider {
    static var previews: some View {
        let 🄽ow:🔛Phase = .Waiting
        
        VStack {
            🔔Icon(ⓟhase: .Waiting, ⓝow: 🄽ow)
            🔔Icon(ⓟhase: .FadeIn, ⓝow: 🄽ow)
            🔔Icon(ⓟhase: .MaxVolume, ⓝow: 🄽ow)
            🔔Icon(ⓟhase: .FadeOut, ⓝow: 🄽ow)
        }
    }
}
