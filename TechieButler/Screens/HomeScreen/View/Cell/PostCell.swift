//
//  PostCell.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import SwiftUI

struct PostCell: View {
    
    /// the Post
    let post: Post
    
    /// the Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(post.id)")
                .font(.headline)
            Spacer()
            Text("Title: \(post.title)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    PostCell(post: Post(userId: Constants.PostPreviewData.userId,
                       id: Constants.PostPreviewData.id,
                       title: Constants.PostPreviewData.title,
                       body: Constants.PostPreviewData.body))
}
