//
//  Level.swift
//  Accessibility Arcade
//
//  Created by Philipp Nagy on 24.01.25.
//

import SwiftUI

@available(iOS 18.0, *)
@Observable
class Level: Identifiable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    var solved = false
    let viewBuilder: AnyView
    let guideView: AnyView
    let hints: [String]
    let outro: String
    let guideDuration: Int
    
    init(id: Int,
         name: String,
         icon: String,
         color: Color,
         hints: [String],
         outro: String,
         viewBuilder: AnyView,
         guideView: AnyView,
         guideDuration: Int) {
        self.id = id
        self.name = name
        self.icon = icon
        self.color = color
        self.hints = hints
        self.outro = outro
        self.viewBuilder = viewBuilder
        self.guideView = guideView
        self.guideDuration = guideDuration
    }
    
    func solve() {
        solved = true
    }
}

@available(iOS 18.0, *)
extension Level: Equatable {
    static func == (lhs: Level, rhs: Level) -> Bool {
        lhs.id == rhs.id
    }
}
