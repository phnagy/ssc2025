//
//  GuideButton.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 17.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GuideButton: View {
    let level: Level
    
    var body: some View {
        NavigationLink(destination: level.guideView) {
            HStack(alignment: .center) {
                Image(systemName: level.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(level.color)
                    .padding(4)
                VStack(alignment: .leading) {
                    Text(level.name)
                        .font(.headline)
                    Text("\(level.guideDuration)min read")
                        .foregroundStyle(.secondary)
                }
                .padding(.leading, 8)
                Spacer()
            }
        }
    }
}

@available(iOS 18.0, *)
#Preview {
    GuideButton(level: Model().levels.first!)
}
