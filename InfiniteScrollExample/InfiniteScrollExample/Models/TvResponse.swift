//
//  TvResponse.swift
//  InfiniteScrollExample
//
//  Created by wassim on 24/8/2021.
//

import Foundation

struct TvResponse:Codable {
    var page: Int
    var results : [TvShow]
    var total_pages: Int
    
    
    
    
    enum CodingKey: String {
        case page
        case results
        case total_pages
    }
    
    
    init(){
        page = 1
        results = []
        total_pages = 500
    }
    
   
    
}
