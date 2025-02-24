//
//  GuideDarkModeView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GuideDarkModeView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State var showPrimaryColor = false
    
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
                WebLinksView(links: LEVEL_1_GUIDE_LINKS)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    func intro() -> some View {
        Text(LocalizedStringKey(LEVEL_1_GUIDE_1))
            .navigationTitle("Dark Mode")
    }
    
    func problem() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Problem")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_1_GUIDE_2))
        }
    }
    
    func example() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Example")
                .font(.title3)
                .bold()
            Toggle(isOn: $showPrimaryColor) {
                HStack {
                    Text(LocalizedStringKey("Use `.primary`"))
                    Spacer()
                }
            }
            .row()
            CodeBlockView(code: "Text(\"Hello World!\")\n\t.foregroundStyle(.\(showPrimaryColor ? "primary" : "black"))")
            Text("Hello World!")
                .foregroundStyle(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(.rect(cornerRadius: 8))
                .caption("\(showPrimaryColor ? "Primary" : "Black") text in light mode")
                .padding(.top, 8)
            Text("Hello World!")
                .foregroundStyle(showPrimaryColor ? .white : .black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.black)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 2)
                )
                .caption("\(showPrimaryColor ? "Primary" : "Black") text in dark mode")
            
        }
    }
    
    func systemColors() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("System colors")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_1_GUIDE_3))
                .padding(.bottom, 8)
            LazyVGrid(columns: columns, spacing: 16) {
                ColorView(color: "Red", suffix1: "Light", suffix2: "Dark", split: true)
                ColorView(color: "Blue", suffix1: "Light", suffix2: "Dark", split: true)
                ColorView(color: "Green", suffix1: "Light", suffix2: "Dark", split: true)
                ColorView(color: "Yellow", suffix1: "Light", suffix2: "Dark", split: true)
            }
        }
    }
    
    
    
    func customColors() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Custom colors")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_1_GUIDE_4))
                .padding(.bottom, 16)
            Image("DarkMode-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .caption("Custom Dark Mode colors in Assets")
            Text(LocalizedStringKey(LEVEL_1_GUIDE_5))
                .padding(.top, 8)
        }
    }
    
}

@available(iOS 18.0, *)
#Preview {
    GuideDarkModeView()
}



//                    LazyVGrid(columns: columns, spacing: 16) {
//                        ColorsView(color: "Red", suffix1: "Default", suffix2: "Accessible", split: false)
//                        ColorsView(color: "Blue", suffix1: "Default", suffix2: "Accessible", split: false)
//                        ColorsView(color: "Green", suffix1: "Default", suffix2: "Accessible", split: false)
//                        ColorsView(color: "Yellow", suffix1: "Default", suffix2: "Accessible", split: false)
//                    }



