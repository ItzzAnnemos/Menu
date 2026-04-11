//
//  MenuDetailsView.swift
//  Menu
//
//  Created by Nikola Serafimov on 23.3.26.
//

import SwiftUI
import PhotosUI

struct MenuDetailView: View {
    let item: MenuItem
    let accentColor: Color
    
    @EnvironmentObject var appState: AppState
    @State private var newComment: String = ""
    @State private var pendingImage: UIImage? = nil
    @State private var showImagePicker = false
    @State private var imagePickerSource: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // Hero image
                GeometryReader { geo in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: 300)
                        .clipped()
                }
                .frame(height: 300)
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
                    
                    // Comments & Photos
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
                            ForEach(comments) { comment in
                                CommentBubble(comment: comment, accentColor: accentColor)
                            }
                        }
                        
                        
                        // Input row
                        VStack(spacing: 8) {
                            if let pending = pendingImage {
                                VStack(spacing: 0) {
                                    // Image + remove button on top left
                                    HStack(alignment: .top, spacing: 0) {
                                        ZStack(alignment: .topTrailing) {
                                            Image(uiImage: pending)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60)
                                                .clipped()
                                                .cornerRadius(8, corners: [.topLeft])
                                                .padding(8)

                                            Button(action: { pendingImage = nil }) {
                                                Image(systemName: "xmark.circle.fill")
                                                    .font(.system(size: 18))
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 2)
                                            }
                                        }
                                        Spacer()
                                    }

                                    Divider()

                                    // Text input + send
                                    HStack(spacing: 10) {
                                        TextField("Напиши коментар...", text: $newComment)
                                            .padding(10)
                                            .font(.system(size: 14))
                                            .onSubmit { submitComment() }

                                        Button(action: submitComment) {
                                            Image(systemName: "paperplane.fill")
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .background(accentColor)
                                                .cornerRadius(10)
                                        }
                                    }
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 6)
                                }
                                .background(Color(.systemGray6))
                                .cornerRadius(12)

                            } else {
                                HStack(spacing: 10) {
                                    Button(action: {
                                        imagePickerSource = .camera
                                        showImagePicker = true
                                    }) {
                                        Image(systemName: "camera.fill")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(accentColor)
                                            .cornerRadius(10)
                                    }

                                    Button(action: {
                                        imagePickerSource = .photoLibrary
                                        showImagePicker = true
                                    }) {
                                        Image(systemName: "photo.fill")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(accentColor)
                                            .cornerRadius(10)
                                    }

                                    TextField("Напиши коментар...", text: $newComment)
                                        .padding(10)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                        .font(.system(size: 14))
                                        .onSubmit { submitComment() }

                                    Button(action: submitComment) {
                                        Image(systemName: "paperplane.fill")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(accentColor)
                                            .cornerRadius(10)
                                    }
                                }
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
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: imagePickerSource) { image in
                pendingImage = image
            }
        }
    }
    
    func submitComment() {
        let trimmed = newComment.trimmingCharacters(in: .whitespaces)
        if !trimmed.isEmpty || pendingImage != nil {
            appState.addComment(text: trimmed, image: pendingImage, to: item)
            newComment = ""
            pendingImage = nil
        }
    }
}
