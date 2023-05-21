import SwiftUI

enum 🔛Phase {
    case waiting
    case fadeIn
    case maxVolume
    case fadeOut
    case powerOff
}

extension 🔛Phase {
    var title: LocalizedStringResource {
        switch self {
            case .waiting: return "Waiting"
            case .fadeIn: return "Fade in"
            case .maxVolume: return "Max volume"
            case .fadeOut: return "Fade out"
            case .powerOff: return "Power off"
        }
    }
}
