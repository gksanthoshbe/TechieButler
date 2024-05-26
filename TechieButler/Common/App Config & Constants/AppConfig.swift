//
//  AppConfig.swift
//  TechieButler
//
//  Created by Santhosh on 26/05/24.
//

import Foundation

public struct AppConfig {
    
    /// API fetch limit
    static let apiFetchLimit = 10
    
    /// Currently BASE URL for the backend  API calls
    static let baseURL = AppConfig.BaseUrl.DEV

    /** List of Base URLs for development, QA, UAT, and Production environment. */
    struct BaseUrl {
        static let DEV              = "https://jsonplaceholder.typicode.com/"
        static let QA               = "https://jsonplaceholder.typicode.com/"
        static let UAT              = "https://jsonplaceholder.typicode.com/"
        static let PRODUCTION       = "https://jsonplaceholder.typicode.com/"
    }
    
    // MARK: - API end points
    
    struct endpoint {
        static let posts = "posts"
    }
}
