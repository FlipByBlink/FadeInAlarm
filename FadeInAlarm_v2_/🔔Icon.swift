
import SwiftUI


struct 🔔Icon: View {
    
    var ⓟhase: 🔛Phase
    
    var ⓝow: 🔛Phase
    
    @State private var 🅂cale = 0.4
    
    @State private var 🄾pacity = 1.0
    
    
    let 🔉 = 0.4
    
    
    var body: some View {
        
        Group {
            switch ⓟhase {
            case .waiting:
                Image(systemName: "bell")
                    .symbolVariant( ⓝow == .waiting ? .fill : .none)
                    .foregroundColor( ⓝow == .waiting ? nil : .secondary)
                    .symbolVariant(ⓟhase == ⓝow ? .slash : .none)
                    .scaleEffect(🔉)
                
            case .fadeIn:
                Image(systemName: "bell")
                    .symbolVariant( ⓝow == .fadeIn ? .fill : .none)
                    .foregroundColor( ⓝow == .fadeIn ? nil : .secondary)
                    .scaleEffect(🅂cale)
                    .opacity(🄾pacity)
                    .task {
                        🄵ade()
                        Timer.scheduledTimer(withTimeInterval: 🕒, repeats: true) { _ in
                            🄵ade()
                        }
                    }
                
            case .maxVolume:
                Image(systemName: "bell")
                    .symbolVariant( ⓝow == .maxVolume ? .fill : .none)
                    .foregroundColor( ⓝow == .maxVolume ? nil : .secondary)
                
            case .fadeOut:
                Image(systemName: "bell")
                    .symbolVariant( ⓝow == .fadeOut ? .fill : .none)
                    .foregroundColor( ⓝow == .fadeOut ? nil : .secondary)
                    .scaleEffect(🅂cale)
                    .opacity(🄾pacity)
                    .task {
                        🄵ade()
                        Timer.scheduledTimer(withTimeInterval: 🕒, repeats: true) { _ in
                            🄵ade()
                        }
                    }
                
            case .powerOff: Text("👿")
            }
        }
        .padding()
        .font(.largeTitle)
    }
    
    
    let 🕒 = 4.0
    
    func 🄵ade() {
        if ⓟhase == .fadeIn {
            🅂cale = 🔉
            withAnimation {
                🄾pacity = 1.0
            }
            withAnimation(.linear(duration: 🕒)) {
                🅂cale = 1.0
            }
            withAnimation(.linear(duration: 0.2).delay( 🕒 - 0.2 )) {
                🄾pacity = 0.0
            }
        } else if ⓟhase == .fadeOut {
            🅂cale = 1.0
            withAnimation {
                🄾pacity = 1.0
            }
            withAnimation(.linear(duration: 🕒)) {
                🅂cale = 🔉
            }
            withAnimation(.linear(duration: 0.2).delay( 🕒 - 0.2 )) {
                🄾pacity = 0.0
            }
        }
    }
}




struct 🔔View_Previews: PreviewProvider {
    static var previews: some View {
        
        let 🄽ow:🔛Phase = .waiting
        
        VStack {
            🔔Icon(ⓟhase: .waiting, ⓝow: 🄽ow)
            🔔Icon(ⓟhase: .fadeIn, ⓝow: 🄽ow)
            🔔Icon(ⓟhase: .maxVolume, ⓝow: 🄽ow)
            🔔Icon(ⓟhase: .fadeOut, ⓝow: 🄽ow)
        }
    }
}
