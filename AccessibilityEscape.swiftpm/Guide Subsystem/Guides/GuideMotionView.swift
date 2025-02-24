//
//  GuideMotionView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GuideMotionView: View {
    @State private var animate = false
    @State private var requireReducedMotion = true
    @State private var useReduceMotion = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                intro()
                problem()
                example()
                WebLinksView(links: LEVEL_4_GUIDE_LINKS)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    func intro() -> some View {
        Text(LocalizedStringKey(LEVEL_4_GUIDE_1))
            .navigationTitle("Motion")
    }
    
    func problem() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Problem")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_4_GUIDE_2))
        }
    }
    func example() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Example")
                .font(.title3)
                .bold()
            Toggle("Use `reduceMotion`", isOn: $useReduceMotion)
                .row()
            CodeBlockView(code: useReduceMotion ? LEVEL_4_GUIDE_CODE_TRUE : LEVEL_4_GUIDE_CODE_FALSE)
            Toggle("Require Reduced Motion", isOn: $requireReducedMotion)
                .row()
            Group {
                if requireReducedMotion && useReduceMotion {
                    Text("Hello World!")
                } else {
                    Text("Hello World!")
                        .scaleEffect(animate ? 1.7 : 1.0)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: !requireReducedMotion), value: animate)
                        .onAppear() {
                            animate.toggle()
                        }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
            )
            .padding(.top, 8)
        }
    }
}

@available(iOS 18.0, *)
#Preview {
    GuideMotionView()
}
