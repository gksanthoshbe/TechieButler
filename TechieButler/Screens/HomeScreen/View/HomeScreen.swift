//
//  HomeScreen.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import SwiftUI

struct HomeScreen: View {
    
    /// the ViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    /// the Body
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(viewModel.postResults) { post in
                        NavigationLink(destination: PostDetailsView(post: post)) {
                            PostCell(post: post)
                                .onAppear {
                                    if post.id == self.viewModel.posts.last?.id {
                                        self.viewModel.fetchPosts()
                                    }
                                }
                        }
                    }
                    if viewModel.isLoading {
                        HStack(spacing: 15) {
                            ProgressView()
                            Text("Loading…")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .listStyle(.automatic)
                .searchable(text: $viewModel.searchText)
            }
            .navigationBarTitle(Constants.ScreenName.homeScreen)
            .gesture(DragGesture()
                .onChanged({ _ in
                    UIApplication.shared.dismissKeyboard()
                })
            )
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    HomeScreen()
}
