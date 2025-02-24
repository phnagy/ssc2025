//
//  AssistantMessage.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 26.01.25.
//

struct AssistantMessage {
    let text: String
    let primaryAction: () -> Void
    let primaryLabel: String?
    let secondaryLabel: String?
    let secondaryAction: () -> Void
    let actionOnShake: (() -> Void)?
    
    init(text: String, primaryLabel: String? = nil, primaryAction: @escaping () -> Void = {}, secondaryLabel: String? = nil, secondaryAction: @escaping () -> Void = {}, actionOnShake: (() -> Void)? = nil) {
        self.text = text
        self.primaryLabel = primaryLabel
        self.primaryAction = primaryAction
        self.secondaryLabel = secondaryLabel
        self.secondaryAction = secondaryAction
        self.actionOnShake = actionOnShake
    }
}

extension AssistantMessage: Identifiable, Equatable {
    var id: String {
        return text + "-" + (primaryLabel ?? "") + "-" + (secondaryLabel ?? "")
    }
    
    static func == (lhs: AssistantMessage, rhs: AssistantMessage) -> Bool {
        lhs.id == rhs.id
    }
}
