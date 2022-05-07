
import SwiftUI


struct 🛠OptionButton: View { // ⚙️
    @EnvironmentObject var 📱: 📱Model
    
    var body: some View {
        Button {
            📱.🛠 = true
        } label: {
            Image(systemName: "gearshape")
                .font(.title)
        }
        .disabled(📱.🔛 != .PowerOff)
        .sheet(isPresented: $📱.🛠) {
            🛠Option()
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
            .fileImporter(isPresented: $📱.📂, allowedContentTypes: [.audio]) { 🅁esult in
                let 🗄 = FileManager.default
                let 🗃 = 🗄.urls(for: .documentDirectory, in: .userDomainMask)[0]
                
                do {
                    let 📦 = try 🅁esult.get()
                    
                    do {
                        let 🗂 = try 🗄.contentsOfDirectory(at: 🗃, includingPropertiesForKeys: nil)
                        if let 📍 = 🗂.first {
                            do { try 🗄.removeItem(at: 📍) } catch { print("👿", error) }
                        }
                    } catch { print(error) }
                    
                    let 🄽ewURL = 🗃.appendingPathComponent(📦.lastPathComponent)
                    
                    if 📦.startAccessingSecurityScopedResource() {
                        do {
                            try 🗄.copyItem(at: 📦, to: 🄽ewURL)
                            📱.💽Name = 🄽ewURL.lastPathComponent
                        } catch { print("👿", error) }
                    }
                    📦.stopAccessingSecurityScopedResource()
                } catch { print("👿", error) }
            }
        }
    }
}


struct 📄Document: View {
    var body: some View {
        List {
            Link(destination: URL(string: "https://apps.apple.com/app/id1465336070")!) {
                Label("AppStore link", systemImage: "link")
            }
            
            Link(destination: URL(string: "https://www.youtube.com/watch?v=d66thA-K5Dg")!) {
                Label("Demo video link", systemImage: "link")
            }
            
            Section {
                Text("""
                    Alarm clock with taking a long time from small volume to max volume.
                    任意の時刻になるとゆったりと少しずつ音量が大きくなるアラームアプリ。
                    
                    [ OPTIONS オプション ]
                    Hour fade-in フェードイン時間
                    ・0:10
                    ・0:30
                    ・1:00
                    ・5:00
                    ・30:00
                    ・1:00:00
                    Hour fade-out フェードアウト時間
                    ・0:03
                    ・0:07
                    ・0:15
                    ・0:30
                    ・1:00
                    Volume on waiting 待機中の音量
                    ・10%
                    ・5%
                    ・3%
                    ・1%
                    ・0%
                    
                    [ REQUIRED 必要 ]
                    Import your favorite audio file such as mp3.
                    音声ファイル(mp3など)をインポートしてください。
                    
                    [ NOTICE 注意 ]
                    App must be launched beforehand in advance.
                    事前にアプリを起動させておく必要があります。
                    """)
                .font(.caption)
                .padding()
                
                Text("version 2.1")
                    .font(.caption)
                    .padding()
            } header: {
                Text("About")
            }
            
            Section {
                Text("""
                    2022-02-25
                    (Japanese)このアプリ自身において、ユーザーの情報を一切収集しません。
                    (English)This application don't collect user infomation.
                    """)
                .font(.caption)
                .padding()
            } header: {
                Text("Privacy Policy")
            }
            
            Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                Label("Source code", systemImage: "link")
            }
        }
        .navigationTitle("📄 Document")
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
