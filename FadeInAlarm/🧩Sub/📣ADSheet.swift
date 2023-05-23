import SwiftUI

struct 📣ADSheet: ViewModifier {
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FadeInAlarm)
    @State private var ⓟresent: Bool = false
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: self.$ⓟresent) {
                📣ADView(self.ⓐpp, second: 8)
                    .environmentObject(🛒)
            }
            .onAppear {
                if 🛒.checkToShowADSheet() { self.ⓟresent = true }
            }
    }
}
