//
//  LevelContrastView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelContrastView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorSchemeContrast) private var colorSchemeContrast
    @Environment(Model.self) private var model
    @State private var tapCount = 0
    @State private var timer: Timer?
    @State var solved = false
    
    var gradientStyle: LinearGradient {
        if colorSchemeContrast == .increased {
            return LinearGradient(colors: [Color.primary], startPoint: .top, endPoint: .bottom)
        } else {
            return LinearGradient(
                gradient: Gradient(colors: [Color.secondary, Color(UIColor.systemBackground)]),
                startPoint: .top,
                endPoint: UnitPoint(x: 0.5, y: 0.8)
            )
        }
    }
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey(LEVEL_2_RIDDLE))
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundStyle(gradientStyle)
                .padding()
                .onTapGesture {
                    if colorSchemeContrast == .increased {
                        handleTap()
                    }
                }
        }
        .level(level: Levels.contrast, solved: solved)
    }
    
    private func handleTap() {
        tapCount += 1
        timer?.invalidate()
        
        if tapCount >= 3 {
            solved = true
            tapCount = 0
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                DispatchQueue.main.async {
                    self.tapCount = 0
                    self.timer?.invalidate()
                }
            }
        }
    }
}

@available(iOS 18.0, *)
#Preview {
    LevelContrastView()
}
