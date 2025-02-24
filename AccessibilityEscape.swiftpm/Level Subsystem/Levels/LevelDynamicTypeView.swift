//
//  LevelDynamicTypeView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct LevelDynamicTypeView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.dynamicTypeSize) var dynamicTypeSize: DynamicTypeSize
    @Environment(Model.self) private var model
    @State var solved = false
    @State var showSolution = false
    @State var font = Font.system(size: 2)
    
    var body: some View {
        VStack {
            Text(LEVEL_3_RIDDLE)
                .font(font)
                .multilineTextAlignment(.center)
                .padding()
                .onLongPressGesture {
                    if showSolution {
                        solved = true
                    }
                }
        }
        .task {
            checkSolved(dynamicTypeSize: dynamicTypeSize)
        }
        .level(level: Levels.dynamicType, solved: solved)
        .onChange(of: dynamicTypeSize) {
            checkSolved(dynamicTypeSize: dynamicTypeSize)
        }
    }
    
    func checkSolved(dynamicTypeSize: DynamicTypeSize) {
        if [.xxLarge, .xxxLarge, .accessibility1, .accessibility2, .accessibility3, .accessibility4, .accessibility5].contains(dynamicTypeSize) {
            showSolution = true
            font = .title3
            return
        }
        showSolution = false
        font = Font.system(size: 2)
    }
}

@available(iOS 18.0, *)
#Preview {
    LevelDynamicTypeView()
}
