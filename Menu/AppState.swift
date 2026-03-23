//
//  AppState.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var comments: [String: [String]] = [:] {
        didSet {
            if let encoded = try? JSONEncoder().encode(comments) {
                UserDefaults.standard.set(encoded, forKey: "comments")
            }
        }
    }

    init() {
        if let data = UserDefaults.standard.data(forKey: "comments"),
           let decoded = try? JSONDecoder().decode([String: [String]].self, from: data) {
            comments = decoded
        }
    }

    func addComment(_ comment: String, to item: MenuItem) {
        let key = item.id.uuidString
        if comments[key] == nil {
            comments[key] = []
        }
        comments[key]?.append(comment)
    }

    func getComments(for item: MenuItem) -> [String] {
        comments[item.id.uuidString] ?? []
    }
}
