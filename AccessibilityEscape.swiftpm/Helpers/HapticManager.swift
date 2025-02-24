//
//  HapticManager.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 19.02.25.
//

import UIKit

@MainActor
class HapticManager {
    static func triggerHapticSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    static func triggerHapticError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
