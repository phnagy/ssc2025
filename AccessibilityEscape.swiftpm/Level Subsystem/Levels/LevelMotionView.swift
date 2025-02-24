//
//  LevelMotionView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelMotionView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(Model.self) var model
    @State var solved = false
    @State private var angle: Double = 0
    @State private var radius: CGFloat = 200
    @State private var timer: Timer?
    
    
    var body: some View {
        VStack {
            Button {
                if reduceMotion {
                    solved = true
                }
            } label: {
                Label(reduceMotion ? "Escape" : "You can't catch me!", systemImage: reduceMotion ? "door.left.hand.open" : "hand.wave")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .offset(x: radius * cos(angle), y: radius * sin(angle))
            .rotationEffect(.degrees(angle * 5))
            .onAppear {
                toggleAnimation()
            }
        }
        .padding()
        .level(level: Levels.motion, solved: solved)
        .onDisappear {
            timer?.invalidate()
        }
        .onChange(of: reduceMotion) {
            toggleAnimation()
        }
    }
    
    private func toggleAnimation() {
        timer?.invalidate()
        if reduceMotion {
            angle = 0
            radius = 0
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            DispatchQueue.main.async {
                angle += 10
                radius += 1
                
                if radius > 400 {
                    radius = 200
                }
            }
        }
    }
}
