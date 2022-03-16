
import SwiftUI


struct 🔔: View {
    
    var size: CGFloat
    
    var isSlash: Bool = false
    
    
    var body: some View {
        
        Image(systemName: isSlash ? "bell.slash" : "bell")
            .padding(2)
            .font(.system(size: size))
    }
}




struct 🔔View_Previews: PreviewProvider {
    static var previews: some View {
        🔔(size: 14)
    }
}
