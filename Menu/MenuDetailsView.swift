//
//  MenuDetailsView.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI

struct MenuDetailView: View {
    let item: MenuItem
    let accentColor: Color

    @EnvironmentObject var appState: AppState
    @State private var newComment: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {

                // Hero image
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                    .padding(.top, 20)

                VStack(alignment: .leading, spacing: 16) {

                    // Title & subtitle
                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.title)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                        Text(item.subtitle)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.secondary)
                    }

                    Divider()

                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("За артиклот")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(accentColor)
                        Text(item.description)
                            .font(.system(size: 15))
                            .foregroundColor(.primary)
                            .lineSpacing(5)
                    }

                    Divider()

                    // Tags
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Категории")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(accentColor)
                        FlowLayout(tags: item.tags, accentColor: accentColor)
                    }

                    Divider()

                    // Comments
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Коментари")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(accentColor)

                        let comments = appState.getComments(for: item)
                        if comments.isEmpty {
                            Text("Сè уште нема коментари.")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                                .italic()
                        } else {
                            ForEach(comments, id: \.self) { comment in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(systemName: "person.circle.fill")
                                        .font(.system(size: 28))
                                        .foregroundColor(accentColor.opacity(0.6))
                                    Text(comment)
                                        .font(.system(size: 14))
                                        .foregroundColor(.primary)
                                        .padding(10)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                }
                            }
                        }

                        // New comment input
                        HStack(spacing: 10) {
                            TextField("Напиши коментар...", text: $newComment)
                                .padding(10)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .font(.system(size: 14))
                                .onSubmit {
                                        let trimmed = newComment.trimmingCharacters(in: .whitespaces)
                                        if !trimmed.isEmpty {
                                            appState.addComment(trimmed, to: item)
                                            newComment = ""
                                        }
                                    }

                            Button(action: {
                                let trimmed = newComment.trimmingCharacters(in: .whitespaces)
                                if !trimmed.isEmpty {
                                    appState.addComment(trimmed, to: item)
                                    newComment = ""
                                }
                            }) {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(accentColor)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding(20)
            }
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}
