import SwiftUI

struct 📄DocumentButton: View { // ⚙️
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Button {
            📱.📄showDocument = true
        } label: {
            Image(systemName: "doc.plaintext")
                .font(.title3)
                .foregroundStyle(📱.🔛phase == .powerOff ? .secondary : .tertiary)
        }
        .disabled(📱.🔛phase != .powerOff)
        .accessibilityLabel("Document")
        .sheet(isPresented: $📱.📄showDocument) {
            NavigationStack {
                📄DocumentMenu()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                📱.📄showDocument = false
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
