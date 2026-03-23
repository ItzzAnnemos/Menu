//
//  RandomCocktailView.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI

struct RandomCocktailView: View {
    @State private var cocktail: Cocktail? = nil
    @State private var isLoading = false
    @State private var errorMessage: String? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if isLoading {
                    VStack(spacing: 16) {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("Вчитување...")
                            .foregroundColor(.secondary)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 100)

                } else if let error = errorMessage {
                    VStack(spacing: 16) {
                        Image(systemName: "wifi.slash")
                            .font(.system(size: 48))
                            .foregroundColor(.secondary)
                        Text(error)
                            .foregroundColor(.secondary)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                        refreshButton
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 100)
                    .padding(.horizontal, 32)

                } else if let cocktail = cocktail {
                    cocktailContent(cocktail)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
        .task { await loadCocktail() }
    }

    // MARK: - Cocktail Content
    func cocktailContent(_ cocktail: Cocktail) -> some View {
        VStack(alignment: .leading, spacing: 0) {

            // Hero image
            ZStack(alignment: .top) {
                AsyncImage(url: URL(string: cocktail.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .overlay(ProgressView())
                }
                .frame(maxWidth: .infinity)
                .frame(height: 420)
                .clipped()

                // Gradient always on top
                LinearGradient(
                    colors: [
                        Color(.systemBackground),
                        Color(.systemBackground).opacity(0.5),
                        Color.clear
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 120)
            }
            .padding(.top, 20)
            

            VStack(alignment: .leading, spacing: 16) {

                // Name & category
                VStack(alignment: .leading, spacing: 6) {
                    Text(cocktail.name)
                        .font(.system(size: 28, weight: .bold))
                    Text(cocktail.category)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                
                // Special notice
                if cocktail.isComplex {
                    HStack(spacing: 10) {
                        Image(systemName: "clock.badge.exclamationmark")
                            .font(.system(size: 20))
                            .foregroundColor(.yellow)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Специјален пијалок")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.yellow)
                            Text("Овој пијалок содржи многу состојки и бара повеќе време за подготовка.")
                                .font(.system(size: 13))
                                .foregroundColor(.secondary)
                                .lineSpacing(3)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(Color.yellow.opacity(0.1))
                    .cornerRadius(12)
                }
                
                Divider()

                // Ingredients
                VStack(alignment: .leading, spacing: 8) {
                    Text("Состојки")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.blue)

                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(cocktail.ingredients, id: \.self) { ingredient in
                            HStack(spacing: 10) {
                                Circle()
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 8, height: 8)
                                Text(ingredient)
                                    .font(.system(size: 15))
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }

                Divider()

                // Instructions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Подготовка")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.blue)
                    Text(cocktail.instructions)
                        .font(.system(size: 15))
                        .foregroundColor(.primary)
                        .lineSpacing(5)
                }

                Divider()

                // Refresh button
                refreshButton
            }
            .padding(20)
        }
    }

    // MARK: - Refresh Button
    var refreshButton: some View {
        Button(action: {
            Task { await loadCocktail() }
        }) {
            HStack(spacing: 8) {
                Image(systemName: "arrow.clockwise")
                Text("Нов пијалок")
            }
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.blue)
            .cornerRadius(14)
        }
    }

    // MARK: - Load
    func loadCocktail() async {
        isLoading = true
        errorMessage = nil
        do {
            cocktail = try await CocktailService.fetchRandom()
        } catch {
            errorMessage = "Неуспешно вчитување. Провери ја интернет врската."
        }
        isLoading = false
    }
}
