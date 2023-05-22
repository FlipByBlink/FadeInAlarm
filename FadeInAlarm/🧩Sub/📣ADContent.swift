import SwiftUI

struct 📣ADContent: View {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FadeInAlarm)
    var body: some View {
        📣ADView(self.ⓐpp, second: 8)
            .environmentObject(🛒)
    }
}
