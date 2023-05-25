import SwiftUI

enum 🧰Info {
    static let appName: LocalizedStringKey = "FadeInAlarm"
    static let appSubTitle: LocalizedStringKey = "App for iPhone / iPad"
    static let versionInfos: [(version: String, date: String)] = [("3.0", "2023-05-25"),
                                                                  ("2.1", "2022-05-09"),
                                                                  ("2.0.1", "2022-04-21"),
                                                                  ("2.0", "2022-02-25"),
                                                                  ("1.0", "2019-05-25")] //降順。先頭の方が新しい
    static let appStoreProductURL = URL(string: "https://apps.apple.com/app/id1465336070")!
    static let privacyPolicyDescription = """
        2022-02-25
        
        (English)
        This application don't collect user infomation.
        
        (Japanese)
        このアプリ自身において、ユーザーの情報を一切収集しません。
        """
    static let webRepositoryURL = URL(string: "https://github.com/FlipByBlink/FadeInAlarm")!
    static let webMirrorRepositoryURL = URL(string: "https://gitlab.com/FlipByBlink/FadeInAlarm_Mirror")!
    enum SourceCodeCategory: String, CaseIterable, Identifiable {
        case main, Sub, Others
        var id: Self { self }
        var fileNames: [String] {
            switch self {
                case .main: return ["FadeInAlarmApp.swift",
                                    "📱AppModel.swift",
                                    "ContentView.swift"]
                case .Sub: return ["📻AlarmPlayer.swift",
                                   "📝DiagramBoard.swift",
                                   "🔛Phase.swift",
                                   "👆Picker.swift",
                                   "📁ImportFile.swift",
                                   "🎚️SystemVolumeSlider.swift",
                                   "🛠️OptionMenu.swift",
                                   "💾FileManager.swift",
                                   "🔔Notification.swift",
                                   "📣ADSheet.swift",
                                   "💁GuideTab.swift",
                                   "🗄️Rest.swift"]
                case .Others: return ["🧰MetaInfo.swift",
                                      "ℹ️AboutApp.swift",
                                      "📣AD.swift",
                                      "🛒InAppPurchase.swift"]
            }
        }
    }
}
