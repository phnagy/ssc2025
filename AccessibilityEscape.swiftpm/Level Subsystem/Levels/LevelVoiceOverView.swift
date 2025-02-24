//
//  LevelVoiceOverView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelVoiceOverView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(Model.self) var model
    @State var solved = false
    @State var text = ""
    @FocusState var isTextFieldActive: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ZStack {
                    Image("VoiceOver-1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Material.ultraThin)
                }
                .clipShape(.rect(cornerRadius: 8))
                .accessibilityLabel("Apples hanging from a tree")
                .accessibilityAddTraits(.isImage)
                
                Rectangle()
                    .foregroundStyle(.secondary)
                    .frame(width: 120, height: 16)
                    .accessibilityHidden(true)
                Rectangle()
                    .foregroundStyle(.tertiary)
                    .frame(width: 64, height: 18)
                    .accessibilityHidden(true)
                TextField("Escape", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, 32)
                    .accessibilityLabel("What fruit can be seen in the image?")
                    .focused($isTextFieldActive)
                    .onChange(of: text) {
                        if text.lowercased() == "apple" {
                            isTextFieldActive = false
                            Task {
                                try? await Task.sleep(nanoseconds: 500_000_000)
                                solved = true
                            }
                        } else {
                            solved = false
                        }
                    }
                    .padding(.bottom, 40)
                Spacer()
            }
            .padding()
            .onTapGesture {
                isTextFieldActive = false
            }
            .level(level: Levels.voiceOver, solved: solved)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
    }
}
