import SwiftUI

struct 🗄️PhaseTitle: View {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some View {
        Text(📱.🔛phase.title)
            .font(.largeTitle.bold())
            .padding(.leading, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
