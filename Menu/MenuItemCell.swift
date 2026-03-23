//
//  MenuItemCell.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI

struct MenuItemCell: View {
    let item: MenuItem
    let accentColor: Color

    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .cornerRadius(14)
                .clipped()

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(.systemBackground))
    }
}
