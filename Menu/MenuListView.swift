//
//  MenuListView.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI

struct MenuListView: View {
    let items: [MenuItem]
    let accentColor: Color

    var body: some View {
        List(items) { item in
            NavigationLink(destination: MenuDetailView(item: item, accentColor: accentColor)) {
                MenuItemCell(item: item, accentColor: accentColor)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparatorTint(accentColor.opacity(0.2))
        }
        .listStyle(.plain)
        .padding(.top, 8)
    }
}
