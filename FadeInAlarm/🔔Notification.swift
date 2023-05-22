import SwiftUI

enum 🔔Notification {
    private static let api = UNUserNotificationCenter.current()
    
    static func removeAllNotifications() {
        Self.api.removeAllDeliveredNotifications()
        Self.api.removeAllPendingNotificationRequests()
    }
    
    static func add(title: LocalizedStringResource,
                    body: LocalizedStringResource? = nil,
                    sound: UNNotificationSound? = nil) {
        let ⓒontent = UNMutableNotificationContent()
        ⓒontent.title = String(localized: title)
        if let body { ⓒontent.body = String(localized: body) }
        ⓒontent.sound = sound
        let ⓣrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let ⓡequest = UNNotificationRequest(identifier: title.key,
                                            content: ⓒontent,
                                            trigger: ⓣrigger)
        Task { try? await Self.api.add(ⓡequest) }
    }
    
    static func setupNotification() {
        Task { try await Self.api.requestAuthorization(options: [.alert, .sound]) }
    }
    
    static func checkAuthDenied() async -> Bool {
        await Self.api.notificationSettings().authorizationStatus == .denied
    }
}

extension 🔔Notification {
    struct Handling: ViewModifier {
        @EnvironmentObject private var 📱: 📱AppModel
        @Environment(\.scenePhase) var scenePhase
        @AppStorage("BackUpAlert") private var ⓑackUpAlertOption: Bool = false
        func body(content: Content) -> some View {
            content
                .task { 🔔Notification.setupNotification() }
                .onChange(of: self.scenePhase) {
                    if $0 == .active { 🔔Notification.removeAllNotifications() }
                }
                .onChange(of: 📱.🔛phase) {
                    if self.ⓑackUpAlertOption, case .maxVolume = $0 {
                        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) {
                            if 📱.🔛phase != .maxVolume {
                                $0.invalidate()
                            } else {
                                🔔Notification.add(title: "Back up alert", sound: .default)
                            }
                        }
                    }
                }
        }
    }
}
