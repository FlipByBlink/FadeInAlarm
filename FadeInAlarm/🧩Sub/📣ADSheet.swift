import SwiftUI
import StoreKit

struct 📣AdImpMenuLink: View {
    @AppStorage("PaidForAppVer_1_2") var ⓟaidForAppVer_1_2: Bool = false
    @State private var ⓟresentDebugLog: Bool = false
    var body: some View {
        if self.ⓟaidForAppVer_1_2 {
            Section {
                NavigationLink {
                    List {
                        Text("You paid for this app before. So \"Hide AD Banner\" option is unlocked. You don't need to pay in-app-purchase.")
                        📣ADMenuLink()
                    }
                    .navigationTitle("Purchase")
                } label: {
                    Label("Paid for this app before", systemImage: "checkmark")
                }
            } header: {
                Text("Purchase")
            }
        } else {
            📣ADMenuLink()
        }
        Button("Present debug log") { self.ⓟresentDebugLog = true }
            .sheet(isPresented: self.$ⓟresentDebugLog) { Self.🄳ebugLog() }
    }
    private struct 🄳ebugLog: View {
        @State private var ⓛog: String?
        var body: some View {
            Text(self.ⓛog ?? "🐛")
                .task { self.ⓛog = await 🛒Purchase.getDebugLog() }
        }
    }
}

struct 📣ADSheet: ViewModifier {
    @EnvironmentObject private var 📱: 📱AppModel
    @EnvironmentObject private var 🛒: 🛒StoreModel
    @State private var ⓐpp: 📣MyApp = .pickUpAppWithout(.FadeInAlarm)
    @State private var ⓟresent: Bool = false
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: self.$ⓟresent) {
                📣ADView(self.ⓐpp, second: 5)
                    .environmentObject(🛒)
            }
            .task {
                guard await !🛒Purchase.userPaidForAppBefore() else { return }
                if 🛒.checkToShowADSheet() { self.ⓟresent = true }
            }
    }
}

enum 🛒Purchase {
    static func userPaidForAppBefore() async -> Bool {
        do {
            let ⓡesult = try await AppTransaction.shared
            switch ⓡesult {
                case .unverified(let ⓢignedType, let ⓥerificationError):
                    print("🖨️unverified(let signedType, let verificationError): ", ⓢignedType, ⓥerificationError)
                    return false
                case .verified(let ⓢignedType):
                    print("🖨️verified(let signedType): ", ⓢignedType)
                    let ⓞriginalAppVersion = ⓢignedType.originalAppVersion
                    let ⓕreeAppVersion = "1000.0"
                    let ⓟaid = Double(ⓞriginalAppVersion)! < Double(ⓕreeAppVersion)!
                    UserDefaults.standard.set(ⓟaid, forKey: "PaidForAppVer_1_2")
                    return ⓟaid
            }
        } catch {
            print("🚨", error)
            return false
        }
    }
    static func getDebugLog() async -> String {
        do {
            let ⓡesult = try await AppTransaction.shared
            switch ⓡesult {
                case .unverified(let ⓢignedType, let ⓥerificationError):
                    return "unverified, \(ⓢignedType), \(ⓥerificationError)"
                case .verified(let ⓢignedType):
                    return ⓢignedType.debugDescription
            }
        } catch {
            return error.localizedDescription
        }
    }
}

//MARK: Paid for app ver 1/2
//Change rule for release-version-number / build-version-number.
//
//release-version-number: MARKETING_VERSION(CFBundleShortVersionString)
//build-version-number: CURRENT_PROJECT_VERSION(CFBundleVersion)
//
//On version 1/2
//- The build number was reset to 1 when the release number was changed. It had been incremented since then.(リリース番号を変更した際にビルド番号を1にリセットしていた。以降インクリメントしていた。)
//
//From version 3
//- For payment determination, build number is set to 1000. Thereafter, it is incremented. Do not reset the build number if the release number is changed.(支払い判定のためにビルド番号を1000スタートにする。以降はインクリメントする。リリース番号を変えた場合でもビルド番号をリセットしない。)
//
//Release history
//ver 2.1: build 1
//ver 2.0.1: build 1
//ver 2.0: build 4
//ver 1.0: build 1
