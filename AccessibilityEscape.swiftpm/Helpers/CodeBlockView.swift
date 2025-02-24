//
//  CodeBlockView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 20.02.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct CodeBlockView: View {
    @Environment(\.colorScheme) var colorScheme
    var code: String
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                HStack {
                    Text(attributedString(for: code))
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                }
            }
            .frame(minWidth: UIScreen.main.bounds.width - 32)
            .background(colorScheme == .dark
                        ? Color(UIColor.tertiarySystemBackground)
                        : Color(UIColor.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: 8))
            .padding(.leading, 16)
            .padding(.trailing, 32)
        }
        .scrollBounceBehavior(.basedOnSize, axes: [.horizontal])
        .scrollIndicators(.never)
        .padding(.trailing, -32)
        .padding(.leading, -16)
    }
    
    // Based on: https://medium.com/@orhanerday/building-a-swiftui-code-block-view-with-syntax-highlighting-d3d737a90a65
    func attributedString(for code: String) -> AttributedString {
        var attributedString = AttributedString(code)
        let keywords = ["let", "var", "if", "else", "struct", "func", "return"]
        let stringPattern = "\".*?\"" // Pattern to match strings
        for keyword in keywords {
            let ranges = code.ranges(of: keyword)
            for range in ranges {
                if let attributedRange = Range(NSRange(range, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = .purple
                }
            }
        }
        
        let contants = [".black", ".blue", ".primary", ".body", ".system(size: 17)", "reduceMotion", ".accessibilityLabel"]
        for constant in contants {
            let ranges = code.ranges(of: constant)
            for range in ranges {
                if let attributedRange = Range(NSRange(range, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = .red
                }
            }
        }
        
        if let regex = try? NSRegularExpression(pattern: stringPattern) {
            let matches = regex.matches(in: code, range: NSRange(code.startIndex..., in: code))
            for match in matches {
                if let stringRange = Range(match.range, in: code),
                   let attributedRange = Range(NSRange(stringRange, in: code), in: attributedString) {
                    attributedString[attributedRange].foregroundColor = .green
                }
            }
        }
        return attributedString
    }
}

extension String {
    /// Helper to find all ranges of a substring within a string
    func ranges(of substring: String) -> [Range<String.Index>] {
        var result: [Range<String.Index>] = []
        var startIndex = self.startIndex
        while startIndex < self.endIndex,
              let range = self.range(of: substring, range: startIndex..<self.endIndex) {
            result.append(range)
            startIndex = range.upperBound
        }
        return result
    }
}
