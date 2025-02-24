//
//  GuideDynamicTypeView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 18.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GuideDynamicTypeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var dynamicTypeSizeIndex: Double = 7
    @State var useDynamicFont: Bool = false
    let dynamicTypeSizes: [DynamicTypeSize] = DynamicTypeSize.allCases
    
    var dynamicTypeSize: DynamicTypeSize {
        return dynamicTypeSizes[Int(dynamicTypeSizeIndex)]
    }
    
    var sliderColor: Color {
        colorScheme == .dark ? Color(UIColor.secondarySystemFill) : Color(UIColor.systemFill)
    }
    
    let textStyles: [TextStyle] = [
        TextStyle(name: "Large Title", size: 34),
        TextStyle(name: "Title 1", size: 28),
        TextStyle(name: "Title 2", size: 22),
        TextStyle(name: "Title 3", size: 20),
        TextStyle(name: "Headline", size: 17),
        TextStyle(name: "Body", size: 17),
        TextStyle(name: "Callout", size: 16),
        TextStyle(name: "Subhead", size: 15),
        TextStyle(name: "Footnote", size: 13),
        TextStyle(name: "Caption 1", size: 12),
        TextStyle(name: "Caption 2", size: 11)
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(.fixed(120), alignment: .trailing)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                intro()
                problem()
                example()
                systemFonts()
                WebLinksView(links: LEVEL_3_GUIDE_LINKS)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    func intro() -> some View {
        Text(LocalizedStringKey(LEVEL_3_GUIDE_1))
            .navigationTitle("Text")
    }
    
    func problem() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Problem")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_3_GUIDE_2))
        }
    }
    
    func example() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Example")
                .font(.title3)
                .bold()
            Toggle("Use Dynamic Font", isOn: $useDynamicFont)
                .row()
            dynamicTypeSlider()
            CodeBlockView(code: "Text(\"Hello World!\")\n\t.font(\(useDynamicFont ? ".body" : ".system(size: 17)"))")
            Text("Hello World!")
                .font(.system(size: getDynamicTextSize(dynamicTypeSize)))
                .padding()
                .frame(maxWidth: .infinity)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                )
                .padding(.top, 16)
            
        }
    }
    
    func dynamicTypeSlider() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Dynamic Type:")
                Spacer()
                Text("\(dynamicTypeSizes[Int(dynamicTypeSizeIndex)].description)")
                    .bold()
            }
            ZStack(alignment: .leading) {
                HStack {
                    ForEach(dynamicTypeSizes.indices, id: \.self) { index in
                        VStack(spacing: 4) {
                            Rectangle()
                                .frame(width: 5, height: 5)
                                .foregroundStyle(sliderColor)
                                .padding(.top, 1)
                            Rectangle()
                                .frame(width: 5, height: 5)
                                .foregroundStyle(sliderColor)
                        }
                        if index != dynamicTypeSizes.indices.last {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 11)
                .padding(.leading, 0)
                Slider(value: $dynamicTypeSizeIndex, in: 0...Double(dynamicTypeSizes.count-1), step: 1)
                    .tint(sliderColor)
            }
        }
        .row()
    }
    
    func systemFonts() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("System Fonts")
                .font(.title3)
                .bold()
            Text(LocalizedStringKey(LEVEL_3_GUIDE_3))
            VStack {
                LazyVGrid(columns: columns, spacing: 10) {
                    Text("Text Style").bold()
                    Text("Size (pt)").bold()
                }
                .padding(.bottom, 5)
                Divider()
                    .background(Color.secondary)
                    .padding(.horizontal, -16)
                ForEach(textStyles.indices, id: \.self) { index in
                    if index != 0 {
                        Divider()
                            .padding(.horizontal, -16)
                    }
                    LazyVGrid(columns: columns, spacing: 10) {
                        Text(textStyles[index].name)
                        Text("\(Int(textStyles[index].size))")
                    }
                }
            }
            .row()
            .padding()
        }
        
    }
    
    func getDynamicTextSize(_ dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        if !useDynamicFont {
            return 17
        }
        let sizeMapping: [DynamicTypeSize: CGFloat] = [
            .xSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .xLarge: 19,
            .xxLarge: 21,
            .xxxLarge: 23,
            .accessibility1: 28,
            .accessibility2: 33,
            .accessibility3: 40,
            .accessibility4: 47,
            .accessibility5: 53
        ]
        
        return sizeMapping[dynamicTypeSize] ?? 17 // Default size
    }
}


@available(iOS 18.0, *)
#Preview {
    GuideDynamicTypeView()
}

extension DynamicTypeSize {
    var description: String {
        "\(self)"
    }
}
