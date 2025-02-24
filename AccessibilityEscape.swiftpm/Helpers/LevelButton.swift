//
//  LevelButton.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 14.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelButton: View {
    @Environment(\.colorScheme) var colorScheme
    var level: Level
    
    var body: some View {
        NavigationLink(destination: level.viewBuilder) {
            HStack {
                VStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        Text(level.name)
                            .foregroundStyle(Color.primary)
                            .fontWeight(.semibold)
                            .padding(.trailing, 6)
                        Spacer()
                        Image(systemName: level.solved ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(level.solved ? .green : Color(UIColor.secondaryLabel))
                    }
                    Image(systemName: level.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .padding(30)
                        .padding(.bottom, -24)
                        .foregroundStyle(level.color)
                    Spacer()
                }
            }
            .padding()
            .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color(UIColor.systemBackground))
            .clipShape(.rect(cornerRadius: 8))
        }
    }
}
