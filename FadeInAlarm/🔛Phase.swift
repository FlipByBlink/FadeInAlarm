import SwiftUI

enum 🔛Phase {
    case waiting
    case fadeIn
    case maxVolume
    case fadeOut
    case powerOff
}

extension 🔛Phase {
    var title: LocalizedStringKey {
        switch self {
            case .waiting: return "WAITING"
            case .fadeIn: return "FADE IN"
            case .maxVolume: return "MAX VOLUME"
            case .fadeOut: return "FADE OUT"
            case .powerOff: return "POWER OFF"
        }
    }
}
