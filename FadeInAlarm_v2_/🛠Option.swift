
import SwiftUI


struct 🛠OptionButton: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        Button {
            📱.🛠OptionAppear = true
        } label: {
            Image(systemName: "doc.plaintext")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .disabled(📱.🔛 != .PowerOff)
        .sheet(isPresented: $📱.🛠OptionAppear) {
            NavigationView {
                📄Document()
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
                    .navigationTitle("FadeInAlarm")
                    .environmentObject(📱)//patch MacOS crash
            }
//            🛠Option()
//                .environmentObject(📱)//patch MacOS crash
        }
    }
}


//struct 🛠Option: View { // ⚙️
//    @EnvironmentObject var 📱: 📱Model
//
//    @Environment(\.dismiss) var 🔙: DismissAction
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Spacer()
//
//                📁ImportFile()
//
//                Spacer()
//
//                NavigationLink {
//                    📄Document()
//                } label: {
//                    Image(systemName: "doc.text.magnifyingglass")
//                        .font(.title.bold())
//                        .foregroundStyle(.secondary)
//                }
//
//                Spacer()
//            }
//            .navigationTitle("FadeInAlarm")
//        }
//    }
//}




//struct 🛠Option_Previews: PreviewProvider {
//    static let 📱 = 📱Model()
//    
//    static var previews: some View {
//        🛠Option()
//            .environmentObject(📱)
//            .previewLayout(.fixed(width: 500, height: 600))
//        
//        📄Document()
//            .environmentObject(📱)
//            .previewLayout(.fixed(width: 400, height: 400))
//    }
//}
