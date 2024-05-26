//
//  PostDetailsView.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import SwiftUI

struct PostDetailsView: View {
    
    /// Post
    let post: Post
    
    /// Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(post.body)
                    .font(.body)
            }
            .padding()
        }
        .navigationBarTitle(Text("Post #\(post.id)"), displayMode: .inline)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

#Preview {
    PostDetailsView(post: Post(userId: Constants.PostPreviewData.userId,
                               id: Constants.PostPreviewData.id,
                               title: Constants.PostPreviewData.title,
                               body: Constants.PostPreviewData.body))
}

