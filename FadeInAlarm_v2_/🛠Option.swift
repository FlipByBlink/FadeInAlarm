
import SwiftUI


struct 🛠OptionButton: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Button {
            📱.🛠OptionAppear = true
        } label: {
            Image(systemName: "doc.plaintext")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .opacity(📱.🔛 != .PowerOff ? 0.6 : 1.0)
        .disabled(📱.🔛 != .PowerOff)
        .sheet(isPresented: $📱.🛠OptionAppear) {
            NavigationView {
                📄Document()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                📱.🛠OptionAppear = false
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




struct 🛠OptionButton_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        🛠OptionButton()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 500, height: 600))
    }
}
