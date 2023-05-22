import SwiftUI

struct 💁GuideTab: View {
    var body: some View {
        NavigationStack {
            List {
                🄵lowSection()
                🄽oteSection()
            }
            .navigationTitle("Guide")
        }
    }
}

private struct 🄵lowSection: View {
    private let ⓢteps: [Int: LocalizedStringKey] = [
        1: "When the user presses the start button, the app starts playing an alarm sound in very low volume (or silence).",
        2: "The application will continue to play the alarm sound repeatedly until the user presses the stop button.",
        3: "At the set time, the volume will gradually increase, reaching its full volume after a user-specified time interval (tens of seconds to tens of minutes).",
        4: "When the stop button is pressed, the volume will gradually decrease at user-specified intervals (from a few seconds to a minute). When the alarm is completely silent, the application stops playing the alarm sound."
    ]
    var body: some View {
        Section {
            ForEach(1 ... 4, id: \.self) { ⓘndex in
                Label {
                    if let ⓣext = self.ⓢteps[ⓘndex] { Text(ⓣext) }
                } icon: {
                    Text("\(ⓘndex).")
                }
            }
        } header: {
            Text("Operation Flow")
        }
    }
}

//### 動作の流れ
//1. 起動ボタンを押すと極小音(もしくは無音)でアラーム音声を再生し始めます。
//2. ユーザーが停止ボタンを押すまでアプリはアラーム音声を繰り返し再生し続けます。
//3. 設定した時刻になると音量が少しずつ大きくなり、ユーザーが指定した時間間隔(数十秒から数十分)で本来の音量に達します。
//4. 停止ボタンを押すとユーザーが指定した時間間隔(数秒から1分)で音量が少しずつ小さくなります。完全に無音になるとアプリはアラーム音声の再生をストップします。

private struct 🄽oteSection: View {
    var body: some View {
        Section {
            Label("You need to prepare your own sound files!", systemImage: "music.note")
            Text("""
            Please import sound source files (mp3, etc.) prepared by the user himself/herself.
            The sound data is preset in the app for testing purposes.
            """)
        } header: {
            Text("Prepare your own sound files")
        }
        Section {
            Text("""
            This app is more inconvenient than ordinary alarm apps!
            For various reasons, this app differs from ordinary alarm apps in that it cannot sound an alarm when the app itself is not running at all. You need to start the app beforehand.
            For example, if you want to use this app at 6:00 a.m. for alarm purposes, please launch the app just before going to bed and press the start button.
            """)
        } header: {
            Text("More inconvenient than ordinary alarm apps")
        }
        Section {
            Text("""
            There are restrictions while in standby
            While in standby mode, you can lock the device or use other apps, but you need to be a little careful not to interrupt the alarm standby state.
            - The following situations will interrupt the alarm standby state
             - Situations where you watch long videos in other apps
             - Playing a song on the device's music application
            - The alarm standby state will be interrupted in the following situations, but will resume automatically.
             - When using the camera application
             - Situations in which some kind of system notification generates an audible alarm
            """)
        } header: {
            Text("There are restrictions while in standby")
        }
    }
}

//### 注意事項
//#### _音源は自分で用意！_
//ユーザー自身が用意した音源ファイル(mp3など)をインポートしてください。
//
//動作確認用の音声データはアプリ内にプリセットされています。
//
//#### _普通のアラームアプリより不便な面あり！_
//諸事情によりこのアプリは一般的なアラームアプリとは異なり、アプリ自身が全く起動していない状態からアラームを鳴らすことはできません。事前にアプリを起動する必要があります。
//
//例えば、目覚まし目的で朝6時にこのアプリを利用したい場合、就寝する直前にアプリを立ち上げて起動ボタンを押してください。
//
//#### _待機中も制限あり！_
//待機中は端末をロックしたり他のアプリを利用したりすることは可能ですが、アラーム待機状態が中断されないように少し注意が必要です。
//
//次のような場面ではアラームの待機状態が中断されます。
//- 他のアプリで長時間の動画を見る場面
//- 端末の音楽アプリで楽曲を再生する場面
//
//次のような場面ではアラームの待機状態が一時中断されますが、自動的に再開されます。
//- カメラアプリを利用している場面
//- システムの何らかの通知で音声が発生する場面
