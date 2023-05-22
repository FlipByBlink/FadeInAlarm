import SwiftUI

struct 🛠️OptionMenu: View {
    var body: some View {
        NavigationStack {
            List {
                🄱ackUpAlertOption()
            }
            .navigationTitle("Option")
        }
    }
}

private struct 🄱ackUpAlertOption: View {
    @AppStorage("BackUpAlert") private var ⓥalue: Bool = false
    var body: some View {
        Section {
            Toggle(isOn: self.$ⓥalue) {
                Label("Back up alert on max volume", systemImage: "bell.and.waves.left.and.right")
            }
        }
    }
}
