//
//  FlowLayout.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI

struct FlowLayout: View {
    let tags: [String]
    let accentColor: Color

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(accentColor)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(accentColor.opacity(0.12))
                        .cornerRadius(20)
                }
            }
        }
    }
}
