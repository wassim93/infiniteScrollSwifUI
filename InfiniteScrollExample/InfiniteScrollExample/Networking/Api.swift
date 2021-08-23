//
//  Api.swift
//  InfiniteScrollExample
//
//  Created by wassim on 23/8/2021.
//

import Foundation


struct Api {
    static let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing-ipad/all"
    
    
    static func getUrlFor(resultLimit : Int) -> String {
        return "\(urlString)/\(resultLimit)/non-explicit.json"
    }
}
