//
//  RowViewModifier.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//

import SwiftUI

struct RowViewModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                colorScheme == .dark
                ? Color(UIColor.tertiarySystemBackground)
                : Color(UIColor.secondarySystemBackground)
            )
            .clipShape(.rect(cornerRadius: 8))
    }
}

extension View {
    func row() -> some View {
        return self.modifier(RowViewModifier())
    }
}
