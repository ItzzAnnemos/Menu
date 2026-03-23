//
//  CoctailService.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import Foundation

class CocktailService {
    static func fetchRandom() async throws -> Cocktail {
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CocktailResponse.self, from: data)
        guard let cocktail = response.drinks.first else {
            throw URLError(.badServerResponse)
        }
        return cocktail
    }
}
