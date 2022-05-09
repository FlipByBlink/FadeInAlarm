
import SwiftUI


struct 🛠OptionButton: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Button {
            📱.🛠OptionAppear = true
        } label: {
            Image(systemName: "gearshape")
                .font(.title)
        }
        .disabled(📱.🔛 != .PowerOff)
        .sheet(isPresented: $📱.🛠OptionAppear) {
            🛠Option()
                .environmentObject(📱)//patch MacOS crash
        }
    }
}


struct 🛠Option: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                📁ImportFile()
                
                Spacer()
                
                NavigationLink {
                    📄Document()
                } label: {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.title.bold())
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
            .navigationTitle("FadeInAlarm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        🔙.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.secondary)
                            .grayscale(1.0)
                            .padding(8)
                    }
                    .accessibilityLabel("Dismiss")
                }
            }
        }
    }
}




struct 🛠Option_Previews: PreviewProvider {
    static let 📱 = 📱Model()
    
    static var previews: some View {
        🛠Option()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 500, height: 600))
        
        📄Document()
            .environmentObject(📱)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
