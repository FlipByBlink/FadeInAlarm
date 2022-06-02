
import SwiftUI

struct 📄DocumentButton: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Button {
            📱.📄DocumentAppear = true
        } label: {
            Image(systemName: "doc.plaintext")
                .font(.title3)
                .foregroundStyle(📱.🔛 == .PowerOff ? .secondary : .tertiary)
        }
        .disabled(📱.🔛 != .PowerOff)
        .accessibilityLabel("Document")
        .sheet(isPresented: $📱.📄DocumentAppear) {
            NavigationView {
                📄DocumentMenu()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                📱.📄DocumentAppear = false
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




struct 📄DocumentButton_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    static var previews: some View {
        VStack {
            📄DocumentButton()
        }
        .environmentObject(📱)
        .previewLayout(.fixed(width: 500, height: 600))
    }
}
