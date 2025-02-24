//
//  WebLinksView.swift
//  AccessibilityEscape
//
//  Created by Philipp Nagy on 20.02.25.
//

import SwiftUI

struct WebLinksView: View {
    let links: [WebLink]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("See Also")
                .font(.title3)
                .bold()
            ForEach(links, id: \.link) {
                WebLinkView(webLink: $0)
            }
        }
    }
}
