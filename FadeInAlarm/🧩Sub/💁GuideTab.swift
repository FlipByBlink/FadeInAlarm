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
        1: "When the user presses the \"Set\" button, the app starts playing an alarm sound in very low volume.",
        2: "The application will continue to play the alarm sound repeatedly until the user presses the stop button.",
        3: "At the alarm time, the volume will gradually increase, reaching its full volume after a user-specified time interval (10 seconds - 1 hour).",
        4: "When the \"Stop\" button is pressed, the volume will gradually decrease at user-specified intervals (3 seconds - 1 minute). When the sound is completely silent, the app stops playing the alarm."
    ]
    var body: some View {
        Section {
            ForEach(1 ... 4, id: \.self) { ⓘndex in
                Label {
                    Text(self.ⓢteps[ⓘndex]!)
                } icon: {
                    Text("\(ⓘndex).")
                }
            }
        } header: {
            Text("Operation flow")
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
            Label("Need to prepare a sound file", systemImage: "music.note")
            Text("""
            Please import sound source files (mp3, etc) prepared by myself.
            The preset sound data is for testing purposes.
            """)
        }
        Section {
            Label {
                Text("This app is more inconvenient than ordinary alarm apps.")
            } icon: {
                Text("😱")
                    .font(.title3)
            }
            Text("""
            For various reasons, this app differs from ordinary alarm apps in that it cannot sound an alarm when the app itself is not running at all. You need to start the app beforehand.
            """)
            Text("""
            For example, if you want to use this app at 6:00 a.m. for alarm purposes, please launch this app just before going to bed and press \"Set\" button.
            """)
            .font(.caption)
        }
        Section {
            Label("There are limitations while in waiting phase", systemImage: "exclamationmark.triangle")
            Text("""
            While in waiting phase, you can lock the device or use other apps, but you need to be a little careful not to interrupt the alarm waiting state.
            """)
            Group {
                Text("""
                __The following situations will interrupt the alarm waiting state__
                ・Situations where you watch long videos in other app
                ・Playing a song on the music app
                """)
                Text("""
                __The alarm waiting state will be interrupted in the following situations, but will resume automatically__
                ・When using the camera app
                ・Situations in which some kind of system notification generates an audible alarm
                """)
            }
            .font(.caption)
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
