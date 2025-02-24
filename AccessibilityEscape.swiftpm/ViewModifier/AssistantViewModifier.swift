//
//  AssistantViewModifier.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct AssistantViewModifier: ViewModifier {
    @Binding var isVisible: Bool
    private var data: AssistantMessage
    
    init(_ isVisible: Binding<Bool>,
         _ assistantMessage: AssistantMessage) {
        self._isVisible = isVisible
        self.data = assistantMessage
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .overlay {
                    if isVisible {
                        Color.black.opacity(0.7)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
                .overlay(alignment: .bottomTrailing) {
                    if isVisible {
                        VStack(alignment: .trailing, spacing: 8) {
                            message()
                            if let secondaryLabel = data.secondaryLabel {
                                button(label: secondaryLabel, action: data.secondaryAction, color: Color(UIColor.systemGray2))
                            }
                            if let primaryLabel = data.primaryLabel {
                                button(label: primaryLabel, action: data.primaryAction, color: Color.blue)
                            }
                            memoji()
                        }
                        .padding(.horizontal, 16)
                        .onShake {
                            if let actionOnShake = data.actionOnShake {
                                isVisible = false
                                HapticManager.triggerHapticSuccess()
                                actionOnShake()
                            }
                        }
                    }
                }
        }
    }
    
    func button(label: String, action: @escaping () -> Void, color: Color) -> some View {
        Button {
            isVisible = false
            action()
        } label: {
            Text(label)
                .padding(8)
                .frame(maxWidth: .infinity)
        }
        .tint(color)
        .buttonStyle(.borderedProminent)
    }
    
    func memoji() -> some View {
        return Image("Memoji")
            .resizable()
            .scaledToFit()
            .frame(width: 124, height: 124)
    }
    
    func message() -> some View {
        return VStack {
            HStack {
                Text(LocalizedStringKey(data.text))
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
    }
}

extension View {
    @available(iOS 18.0, *)
    func assistant(
        isVisible: Binding<Bool>,
        assistantMessage: AssistantMessage) -> some View {
            return self.modifier(AssistantViewModifier(isVisible, assistantMessage))
        }
}
