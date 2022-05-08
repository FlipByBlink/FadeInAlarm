
import SwiftUI


struct 📄Document: View {
    var body: some View {
        List {
            Section {
                let 🔗 = "https://apps.apple.com/app/id1465336070"
                Link(destination: URL(string: 🔗)!) {
                    HStack {
                        Label("Open AppStore page", systemImage: "link")
                        
                        Spacer()
                        
                        Image(systemName: "arrow.up.forward.app")
                    }
                }
                .font(.subheadline)
                
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
                .font(.subheadline)
                .padding(8)
                
                Label("version 2.1", systemImage: "signpost.left")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            } header: {
                Text("About")
            }
            
            Section {
                Text("""
                    2022-02-25
                    (English)This application don't collect user infomation.
                    (Japanese)このアプリ自身において、ユーザーの情報を一切収集しません。
                    """)
                .font(.subheadline)
                .padding(8)
            } header: {
                Text("Privacy Policy")
            }
            
            Link(destination: URL(string: "https://github.com/FlipByBlink/FadeInAlarm_v2")!) {
                Label("Source code", systemImage: "link")
            }
            .font(.subheadline)
        }
        .navigationTitle("Document")
    }
}




struct 📄Document_Previews: PreviewProvider {
    static var previews: some View {
        📄Document()
    }
}
