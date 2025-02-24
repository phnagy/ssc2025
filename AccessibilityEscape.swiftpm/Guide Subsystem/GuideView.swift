//
//  GuideView.swift
//  Accessibility Arcade
//
//  Created by Philipp Nagy on 24.01.25.
//

import SwiftUI

@available(iOS 18.0, *)
struct GuideView: View {
    @Environment(Model.self) var model
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    startView()
                    ForEach(model.levels) { level in
                        Section {
                            GuideButton(level: level)
                        }
                        .listSectionSpacing(16)
                    }
                }
                .padding(.horizontal, -4)
            }
            .navigationTitle("Guide")
        }
    }
    
    func startView() -> some View {
        VStack {
            Image("Logo-AE")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 56)
                .padding()
            Text("Accessibility Escape")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.vertical, 2)
            Text(LocalizedStringKey(GUIDES_VIEW_MESSAGE))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity)
        .padding(4)
        .clipShape(.rect(cornerRadius: 8))
    }
}
