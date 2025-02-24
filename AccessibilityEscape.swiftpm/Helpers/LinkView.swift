//
//  LinkView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 20.02.25.
//

import SwiftUI

struct WebLinkView: View {
    @Environment(\.colorScheme) var colorScheme
    let webLink: WebLink
    
    var body: some View {
        Button {
            if let url = URL(string: webLink.link) {
                UIApplication.shared.open(url)
            }
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(webLink.text)
                        .foregroundStyle(Color.primary)
                        .multilineTextAlignment(.leading)
                    Text(webLink.subText)
                        .foregroundStyle(Color.secondary)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                Image(systemName: "arrow.up.right")
                    .foregroundStyle(Color.secondary)
            }
            .row()
        }
    }
}
