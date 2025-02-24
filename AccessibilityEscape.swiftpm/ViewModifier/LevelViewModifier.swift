//
//  LevelViewModifier.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 17.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelViewModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    @Environment(Model.self) private var model
    @State var hintIndex: Int = -1
    @State var isSheetPresented = false
    private var level: Level
    var solved: Bool
    
    init(_ level: Level, _ solved: Bool) {
        self.level = level
        self.solved = solved
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Open System Settings", systemImage: "accessibility") {
                        if let url = URL(string: "App-Prefs:root=ACCESSIBILITY") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Hint", systemImage: "questionmark") {
                        hintIndex = min(hintIndex + 1, 2)
                        if level.hints.indices.contains(hintIndex) {
                            model.showAssistant(text: level.hints[hintIndex], primaryLabel: "Continue")
                        }
                    }
                }
            }
            .task {
                model.visibility = .hidden
            }
            .navigationBarBackButtonHidden(true)
            .onDisappear {
                model.visibility = .visible
            }
            .navigationTitle(level.name)
            .onShake {
                HapticManager.triggerHapticSuccess()
                model.showAssistant(text: LEAVING_LEVEL_MESSAGE,
                                    primaryLabel: LEAVING_LEVEL_ACTION_LABEL_1,
                                    primaryAction: { dismiss() },
                                    secondaryLabel: LEAVING_LEVEL_ACTION_LABEL_2)
            }
            .sheet(isPresented: $isSheetPresented, onDismiss: { dismiss() }) {
                NavigationStack {
                    level.guideView
                        .navigationTitle(level.name)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button("Done") {
                                    isSheetPresented = false
                                }
                            }
                        }
                }
                
            }
            .onChange(of: solved) {
                model.solveLevel(level.id)
                model.showAssistant(text: level.outro,
                                    primaryLabel: LEVEL_SOLUTION_LABEL_1,
                                    primaryAction: { isSheetPresented = true },
                                    secondaryLabel: LEVEL_SOLUTION_LABEL_2,
                                    secondaryAction: { dismiss() })
            }
    }
}

extension View {
    @available(iOS 18.0, *)
    func level(level: Level, solved: Bool) -> some View {
        return self.modifier(LevelViewModifier(level, solved))
    }
}
