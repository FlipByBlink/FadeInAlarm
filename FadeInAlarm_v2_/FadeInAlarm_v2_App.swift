
import SwiftUI


@main
struct FadeInAlarm_v2_App: App {
    
    @StateObject var 📱 = 📱Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(📱)
        }
    }
}
