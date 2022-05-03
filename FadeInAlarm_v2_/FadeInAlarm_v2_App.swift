
import SwiftUI


@main
struct FadeInAlarm_v2_App: App {
    
    @StateObject var 📱 = 📱Model()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                
                ContentView()
                    .environmentObject(📱)
            }
        }
    }
}
