import SwiftUI

struct 📄DocumentButton: View { // ⚙️
    @EnvironmentObject private var 📱: 📱AppModel
    @State private var 🚩showDocument: Bool = false
    var body: some View {
        Button {
            self.🚩showDocument = true
        } label: {
            Image(systemName: "doc.plaintext")
                .font(.title3)
                .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
        }
        .disabled(📱.🔛phase != .powerOff)
        .accessibilityLabel("Document")
        .sheet(isPresented: self.$🚩showDocument) {
            NavigationStack {
                📄DocumentMenu()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                self.🚩showDocument = false
                            } label: {
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.secondary)
                                    .grayscale(1.0)
                                    .padding(8)
                            }
                            .accessibilityLabel("Dismiss")
                        }
                    }
                    .navigationTitle("FadeInAlarm")
                    .environmentObject(📱) //patch MacOS crash
            }
        }
    }
}
