//
//  HomeViewModel.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    /// posts
    @Published var posts: [Post] = []
    
    /// isLoading
    @Published var isLoading = false
    
    /// Search text
    @Published var searchText: String = ""
    
    /// Post results
    var postResults: [Post] {
        guard !searchText.isEmpty else { return posts }
        return posts.filter { $0.title.contains(searchText.lowercased())} //||
                                //$0.body.contains(searchText)}
    }
    
    /// posts count
    var postsCount: Int {
        postResults.count
    }
    
    /// current page
    private var currentPage = 1
    
    /// session
    private let session: URLSession
    
    /// initailize
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    /// fetch posts
    func fetchPosts() {
        // data fetch start time
        let startTime = Date()
        
        guard !isLoading else { return }
        isLoading = true
        
        let urlString = "\(AppConfig.baseURL)\(AppConfig.endpoint.posts)?_page=\(currentPage)&limit=\(AppConfig.apiFetchLimit)"
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { data, _, error in
            // data fetch end time
            let endTime = Date()
            guard let data = data, error == nil else {
                debugPrint("data fetch error: ", error?.localizedDescription ?? "Unknown error")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            do {
                let newPosts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    
                    // api elapsed time
                    let elapsedTime = endTime.timeIntervalSince(startTime)
                    print("Post# \(self.currentPage) - Data fetching time: \(elapsedTime) secs")
                    
                    self.posts.append(contentsOf: newPosts)
                    self.currentPage += 1
                    self.isLoading = false
                }
            } catch {
                debugPrint("json decoding error:", error.localizedDescription)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
}

