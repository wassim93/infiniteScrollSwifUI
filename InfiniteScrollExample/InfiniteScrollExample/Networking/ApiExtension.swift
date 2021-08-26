//
//  ApiExtension.swift
//  InfiniteScrollExample
//
//  Created by wassim on 23/8/2021.
//

import Foundation


extension Api{
    
    static let baseUrl = "https://api.themoviedb.org/3"
    static let popularUrl = "\(baseUrl)/tv/popular"
    static let searchUrl = "\(baseUrl)/search/tv"

    
    static let imageUrl = "https://image.tmdb.org/t/p/w500"
    
    
    static func getPopularUrl(page: Int) -> String {
        return "\(popularUrl)?api_key=\(apiKey)&page=\(page)"
    }
    
    static func getSearchUrl(query: String) -> String {
        return "\(searchUrl)?api_key=\(apiKey)&query=\(query)"
    }
    
    static func getImageFor(path: String) -> String {
        return "\(imageUrl)\(path)"
    }
}
