//
//  LevelsView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 21.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelsView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.colorScheme) var colorScheme
    @Environment(Model.self) var model
    
    var columns: [GridItem] {
        let columnCount = sizeCategory.isAccessibilityCategory ? 1 : 2
        return Array(repeating: GridItem(.flexible()), count: columnCount)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    startView()
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(model.levels, id: \.id) { level in
                            LevelButton(level: level)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle("Escape")
            .background(colorScheme == .dark ? Color(UIColor.systemBackground) : Color(UIColor.secondarySystemBackground))
        }
        .toolbar(model.visibility, for: .tabBar)
    }
    
    func startView() -> some View {
        VStack {
            Image("Logo-AE")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 56)
                .padding()
            Text("Accessibility Escape")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 2)
            Text(LocalizedStringKey(LEVELS_VIEW_MESSAGE))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
                .padding(.bottom, 16)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color(UIColor.systemBackground))
        .clipShape(.rect(cornerRadius: 8))
    }
}

@available(iOS 18.0, *)
#Preview {
    LevelsView()
        .environment(Model())
}
