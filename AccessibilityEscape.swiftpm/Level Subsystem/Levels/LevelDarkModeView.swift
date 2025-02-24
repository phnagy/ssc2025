//
//  LevelDarkModeView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelDarkModeView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @Environment(Model.self) private var model: Model
    @State var riddleText: String = ""
    @State var hideBarBackButton = false
    @State var showLevel = false
    @State var showSolution = false
    @State var solved = false
    
    var body: some View {
        let isDarkMode = colorScheme == .dark
        VStack {
            if showLevel {
                ZStack {
                    ScrollView {
                        VStack {
                            Text(riddleText)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding(.top, 150)
                            
                            if showSolution {
                                Image(systemName: "arrow.down")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .symbolEffect(.pulse)
                                    .padding(.top, 80)
                                Button {
                                    solved = true
                                } label: {
                                    Label("Escape", systemImage: "door.left.hand.open")
                                        .padding(8)
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.borderedProminent)
                                .padding(.top, 560)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
                }
            }
        }
        .onChange(of: colorScheme) {
            showSolution.toggle()
        }
        .task {
            model.visibility = .hidden
            riddleText = isDarkMode ? LEVEL_1_RIDDLE_DARK : LEVEL_1_RIDDLE_LIGHT
            
            Task {
                try? await Task.sleep(nanoseconds: 500_000_000)
                hideBarBackButton = true
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                model.showAssistant(text: FIRST_LEVEL_MESSAGE,
                                    secondaryLabel: FIRST_LEVEL_ACTION_LABEL,
                                    secondaryAction: { showLevel = true; model.resetAssistant() },
                                    actionOnShake: { showLevel = true; model.resetAssistant() })
            }
        }
        .level(level: Levels.darkMode, solved: solved)
        .navigationBarBackButtonHidden(hideBarBackButton)
    }
}
