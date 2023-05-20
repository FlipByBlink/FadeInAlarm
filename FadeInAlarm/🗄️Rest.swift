import SwiftUI

struct 🗄️PhaseTitle: ToolbarContent {
    @EnvironmentObject private var 📱: 📱AppModel
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(📱.🔛phase.title)
                .fontWeight(.semibold)
                .animation(.default, value: 📱.🔛phase)
        }
    }
}
