
import SwiftUI


struct 🔗Link: View {
    var body: some View {
        Menu {
            Link("AppStore link",
                 destination: URL(string: "https://apps.apple.com/app/id1465336070")!)
            
            Link("Source code link",
                 destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!)
        } label: {
            Image(systemName: "link")
        }
        .font(.body.bold())
    }
}




struct 🔗Link_Previews: PreviewProvider {
    static var previews: some View {
        🔗Link()
    }
}
