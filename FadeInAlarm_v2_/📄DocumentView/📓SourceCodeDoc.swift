
import SwiftUI


struct 📓SourceCodeDoc: View {
    @Environment(\.dismiss) var 🔙: DismissAction
    
    var body: some View {
        List {
            📑Section("📁₀")
            
            📑Section("📁₁")
            
            📑Section("📁₂")
            
            📑Section("📁₃")
            
            
            📑BundleMainInfoDictionary()
            
            let 🔗 = "https://github.com/FlipByBlink/FadeInAlarm_v2"
            Section {
                Link(destination: URL(string: 🔗)!) {
                    HStack {
                        Label("Web Repository link", systemImage: "link")
                        
                        Spacer()
                        
                        Image(systemName: "arrow.up.forward.app")
                    }
                }
            } footer: {
                Text(🔗)
            }
        }
        .navigationTitle("Source code")
    }
}


struct 📑Section: View {
    var ⓓirPath: String
    
    var 📁URL: URL {
        Bundle.main.bundleURL.appendingPathComponent(ⓓirPath)
    }
    
    var 📦: [String] {
        try! FileManager.default.contentsOfDirectory(atPath: 📁URL.path)
    }
    
    var body: some View {
        Section {
            ForEach(📦, id: \.self) { 📃 in
                NavigationLink(📃) {
                    let 📍 = 📁URL.appendingPathComponent(📃)
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
                            📄View(try! String(contentsOf: 📍), 📃)
                        }
                    }
                }
            }
        }
    }
    
    init(_ ⓓirPath: String) {
        self.ⓓirPath = ⓓirPath
    }
}


struct 📄View: View {
    var 📄: String
    
    var 🏷: String
    
    var body: some View {
        Text(📄)
            .navigationBarTitle(🏷)
            .navigationBarTitleDisplayMode(.inline)
            .font(.caption.monospaced())
            .padding()
    }
    
    init(_ 📄: String, _ 🏷: String) {
        self.📄 = 📄
        self.🏷 = 🏷
    }
}


let 🄱undleMainInfoDictionary = Bundle.main.infoDictionary!.description
struct 📑BundleMainInfoDictionary: View {
    var body: some View {
        Section {
            NavigationLink("Bundle.main.infoDictionary") {
                ScrollView {
                    📄View(🄱undleMainInfoDictionary, "Bundle.main.infoDictionary")
                }
            }
        }
    }
}








struct 📓SourceCodeDoc_Previews: PreviewProvider {
    static var previews: some View {
        📓SourceCodeDoc()
    }
}
