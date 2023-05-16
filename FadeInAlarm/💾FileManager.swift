import Foundation

enum 💾FileManager {
    private static let api: FileManager = .default
    static let documentDirectoryURL = Self.api.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static func removeItem(at ⓤrl: URL) {
        do {
            try Self.api.removeItem(at: ⓤrl)
        } catch {
            print("🚨", error); assertionFailure()
        }
    }
    static func copyItem(at ⓢrcURL: URL, to ⓓstURL: URL) {
        do {
            try Self.api.copyItem(at: ⓢrcURL, to: ⓓstURL)
        } catch {
            print("🚨", error); assertionFailure()
        }
    }
}

extension 💾FileManager {
    static func getImportedFileURL() -> URL? {
        do {
            let ⓤrls = try Self.api.contentsOfDirectory(at: Self.documentDirectoryURL, includingPropertiesForKeys: nil)
            guard ⓤrls.count <= 1 else { assertionFailure(); return nil }
            return ⓤrls.first
        } catch {
            assertionFailure(); return nil
        }
    }
    static func urlToSave(_ ⓕileName: String) -> URL {
        Self.documentDirectoryURL.appendingPathComponent(ⓕileName)
    }
}
