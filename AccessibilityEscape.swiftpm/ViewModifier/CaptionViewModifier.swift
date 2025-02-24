//
//  CaptionViewModifier.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 20.02.25.
//

import SwiftUI

struct CaptionViewModifier: ViewModifier {
    let caption: String
    let spacing: Int
    
    func body(content: Content) -> some View {
        VStack(spacing: CGFloat(spacing)) {
            content
            Text(caption)
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        
        
    }
}

extension View {
    func caption(_ caption: String, spacing: Int = 4) -> some View {
        return self.modifier(CaptionViewModifier(caption: caption, spacing: spacing))
    }
}
