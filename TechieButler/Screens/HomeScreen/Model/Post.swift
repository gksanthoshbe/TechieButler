//
//  PostModel.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import Foundation

struct Post: Identifiable, Codable {
    
    /// User id
    let userId: Int
    
    /// Id
    let id: Int
    
    /// Title
    let title: String
    
    /// Body
    let body: String
    
    /// initialize
    init(userId: Int,
         id: Int,
         title: String,
         body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
