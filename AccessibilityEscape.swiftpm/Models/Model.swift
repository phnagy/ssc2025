//
//  Model.swift
//  Accessibility Arcade
//
//  Created by Philipp Nagy on 24.01.25.
//

import SwiftUI

@available(iOS 18.0, *)
@Observable
class Model {
    var isAssistantVisible = false
    var assistantMessage: AssistantMessage
    var levels: [Level]
    var visibility: Visibility = .visible
    
    @MainActor
    init() {
        assistantMessage = AssistantMessage(text: "")
        
        levels = [
            Levels.darkMode,
            Levels.contrast,
            Levels.dynamicType,
            Levels.motion,
            Levels.voiceOver
        ]
    }
    
    func solveLevel(_ id: Int) {
        levels.first { $0.id == id }?.solve()
    }
    
    func showAssistant(text: String, primaryLabel: String? = nil, primaryAction: @escaping () -> Void = {}, secondaryLabel: String? = nil, secondaryAction: @escaping () -> Void = {}, actionOnShake: (() -> Void)? = nil) {
        assistantMessage = AssistantMessage(text: text, primaryLabel: primaryLabel, primaryAction: primaryAction, secondaryLabel: secondaryLabel, secondaryAction: secondaryAction, actionOnShake: actionOnShake)
        isAssistantVisible = true
    }
    
    func resetAssistant() {
        assistantMessage = AssistantMessage(text: "")
    }
}
