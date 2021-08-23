//
//  ApiExtension.swift
//  InfiniteScrollExample
//
//  Created by wassim on 23/8/2021.
//

import Foundation


extension Api{
    
    static let baseUrl = "https://api.themoviedb.org/3/tv/popular"
    
    static let imageUrl = "https://image.tmdb.org/t/p/w500"
    
    
    static func getUrlFor(page: Int) -> String {
        return "\(baseUrl)?api_key=\(apiKey)&page=\(page)"
    }
    
    static func getImageFor(path: String) -> String {
        return "\(imageUrl)\(path)"
    }
}
