//
//  GuideContrastView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GuideContrastView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State var systemBlueColor = false
    @State var requireInceasedContrast = true
    @State var lastStateSuccess = false
    
    var columns: [GridItem] {
        let columnCount = sizeCategory.isAccessibilityCategory ? 1 : 2
        return Array(repeating: GridItem(.flexible()), count: columnCount)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                intro()
                problem()
                example()
                systemColors()
                customColors()
                WebLinksView(links: LEVEL_2_GUIDE_LINKS)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    func intro() -> some View {
        Text(LocalizedStringKey(LEVEL_2_GUIDE_1))
            .navigationTitle("Contrast")
    }
    
    func problem() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Problem")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_2_GUIDE_2))
        }
    }
    
    func example() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Example")
                .font(.title3)
                .bold()
            Toggle(LocalizedStringKey("Use System Color"), isOn: $systemBlueColor)
                .onChange(of: systemBlueColor) {
                    triggerStateChange()
                }
                .row()
            Toggle("Require Icreased Contrast", isOn: $requireInceasedContrast)
                .onChange(of: requireInceasedContrast) {
                    triggerStateChange()
                }
                .row()
            CodeBlockView(code: "Text(\"Hello World!\")\n\t.foregroundStyle(\(systemBlueColor ? ".blue" : "Color(\"CustomBlue\")"))")
            ZStack(alignment: .trailing) {
                Text("Hello World!")
                    .foregroundStyle(computeColor())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .clipShape(.rect(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isSuccess() ? .green : .red, lineWidth: 2)
                    )
                Image(systemName: isSuccess() ? "checkmark" : "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .foregroundStyle(isSuccess() ? .green : .red)
                    .padding(.trailing)
            }
            .caption("\(isSuccess() ? "Passes" : "Failing") \(requireInceasedContrast ? "increased" : "default") contrast requirements")
            .padding(.top, 8)
        }
    }
    
    func systemColors() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("System colors")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_2_GUIDE_3))
                .padding(.bottom, 8)
            LazyVGrid(columns: columns, spacing: 16) {
                ColorView(color: "Red", suffix1: "Default", suffix2: "Accessible", split: false)
                ColorView(color: "Blue", suffix1: "Default", suffix2: "Accessible", split: false)
                ColorView(color: "Green", suffix1: "Default", suffix2: "Accessible", split: false)
                ColorView(color: "Yellow", suffix1: "Default", suffix2: "Accessible", split: false)
            }
        }
    }
    
    
    func customColors() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Custom colors")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_2_GUIDE_4))
                .padding(.bottom, 16)
            Image("Contrast-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .caption("Custom Dark Mode colors in Assets")
            Text(LocalizedStringKey(LEVEL_2_GUIDE_5))
                .padding(.top, 8)
        }
    }
    
    // Helper Functions
    func triggerStateChange() {
        if !lastStateSuccess && isSuccess() {
            HapticManager.triggerHapticSuccess()
            lastStateSuccess = true
        }
        
        if lastStateSuccess && !isSuccess() {
            HapticManager.triggerHapticError()
            lastStateSuccess = false
        }
    }
    
    func isSuccess() -> Bool {
        if requireInceasedContrast && !systemBlueColor {
            return false
        }
        return true
    }
    
    func computeColor() -> Color {
        if systemBlueColor && requireInceasedContrast {
            return Color("BlueAccessible")
        }
        if systemBlueColor {
            return Color("BlueDefault")
        }
        return Color("BlueCustom")
    }
}

@available(iOS 18.0, *)
#Preview {
    GuideContrastView()
}
