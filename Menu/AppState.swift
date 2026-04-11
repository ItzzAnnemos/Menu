//
//  AppState.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import Foundation
import Combine
import UIKit

class AppState: ObservableObject {
    @Published var comments: [String: [Comment]] = [:] {
        didSet {
            saveComments()
        }
    }
    
    private let commentsFileURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docs.appendingPathComponent("comments_v2.json")
    }()
    
    init() {
        loadComments()
        if comments.isEmpty {
            seedComments()
        }
    }
    
    // MARK: - Persistence
    private func saveComments() {
        if let encoded = try? JSONEncoder().encode(comments) {
            try? encoded.write(to: commentsFileURL)
        }
    }
    
    private func loadComments() {
        guard let data = try? Data(contentsOf: commentsFileURL),
              let decoded = try? JSONDecoder().decode([String: [Comment]].self, from: data) else {
            return
        }
        comments = decoded
    }
    
    // MARK: - Comment Actions
    func addComment(text: String, image: UIImage? = nil, to item: MenuItem) {
        let key = item.id.uuidString
        let imageData = image?.jpegData(compressionQuality: 0.6)
        let comment = Comment(text: text, imageData: imageData)
        if comments[key] == nil { comments[key] = [] }
        comments[key]?.append(comment)
    }
    
    func getComments(for item: MenuItem) -> [Comment] {
        comments[item.id.uuidString] ?? []
    }
    
    private func seedComments() {
        let allItems = drinks + foods
        
        let mockComments: [String: [String]] = [
            "Еспресо":          ["Одличен еспресо, токму онака силен!", "Совршен за наутро 🔥"],
            "Капучино":         ["Најдоброто капучино во градот.", "Млечната пена е совршена!"],
            "Портокалов сок":   ["Свеж и природен, препорачувам!", "Многу освежувачки."],
            "Зелен чај":        ["Лесен и вкусен, идеален за попладне."],
            "Лимонада":         ["Совршена за летен ден ☀️", "Многу освежувачка со нане!"],
            "Милкшејк":         ["Кремаст и вкусен, ќе нарачам пак!", "Чоколадниот е фантастичен."],
            "Газирана вода":    ["Секогаш ладна и свежа."],
            "Топла чоколада":   ["Совршена за зима ❄️", "Со шлаг е уште подобра!"],
            "Маргарита пица":   ["Класика која никогаш не разочарува.", "Кората е совршено тенка!"],
            "Цезар салата":     ["Свежа и вкусна, дресингот е одличен.", "Омилена салата!"],
            "Чизбургер":        ["Сочен и вкусен, најдобриот бургер!", "Со помфрит е совршена комбинација 🍔"],
            "Шпагети":          ["Болоњезе сосот е фантастичен!", "Баш како во Италија."],
            "Суши ролна":       ["Свеж лосос, топ квалитет! 🍣", "Најдоброто суши во Скопје."],
            "Такос":            ["Зачинети баш колку треба!", "Авокадо кремот е одличен 🌮"],
            "Палачинки":        ["Пухкави и вкусни, совршен појадок!", "Со јаворов сируп се топ 🥞"],
            "Грчка салата":     ["Свежа и лесна, секогаш добар избор.", "Фета сирењето е вистинско!"],
        ]
        
        for item in allItems {
            if let commentTexts = mockComments[item.title] {
                let key = item.id.uuidString
                comments[key] = commentTexts.map { Comment(text: $0) }
            }
        }
    }
}
