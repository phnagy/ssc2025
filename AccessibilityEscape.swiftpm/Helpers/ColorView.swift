//
//  ColorView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 20.02.25.
//

import SwiftUI

struct ColorView: View {
    let color: String
    let suffix1: String
    let suffix2: String
    let split: Bool
    
    var body: some View {
        VStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color("\(color)\(suffix1)"), location: 0.0),
                            .init(color: Color("\(color)\(suffix1)"), location: 0.5),
                            .init(color: Color("\(color)\(suffix2)"), location: 0.5),
                            .init(color: Color("\(color)\(suffix2)"), location: 1.0)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .padding(16)
                .background {
                    if split {
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .white, location: 0.0),
                                .init(color: .white, location: 0.5),
                                .init(color: .black, location: 0.5),
                                .init(color: .black, location: 1.0)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    }
                }
        }
        .caption("\(color) color")
    }
}
