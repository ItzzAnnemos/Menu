//
//  CommentBubble.swift
//  Menu
//
//  Created by Nikola Serafimov on 11/04/2026.
//

import SwiftUI

struct CommentBubble: View {
    let comment: Comment
    let accentColor: Color

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(accentColor.opacity(0.6))

            VStack(alignment: .leading, spacing: 0) {
                // Image inside bubble
                if let image = comment.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 220)
                        .frame(height: 140)
                        .clipped()
                        .cornerRadius(comment.text.isEmpty ? 10 : 0)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                        .cornerRadius(comment.text.isEmpty ? 10 : 0, corners: [.bottomLeft, .bottomRight])
                }

                // Text inside bubble
                if !comment.text.isEmpty {
                    Text(comment.text)
                        .font(.system(size: 14))
                        .foregroundColor(.primary)
                        .padding(10)
                        .frame(maxWidth: 220, alignment: .leading)
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)

            Spacer()
        }
    }
}

// Corner radius helper
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
