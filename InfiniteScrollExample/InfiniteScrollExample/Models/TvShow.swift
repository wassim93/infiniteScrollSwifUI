//
//  TvShow.swift
//  InfiniteScrollExample
//
//  Created by wassim on 23/8/2021.
//

import Foundation


struct TvShow: Codable,Identifiable {
    var original_name: String
    var poster_path: String
    var first_air_date: String
    var vote_average: Double
    
    enum CodingKey : String {
        case original_name
        case poster_path
        case first_air_date
        case vote_average
    }
    
    init() {
        original_name = ""
        poster_path = ""
        first_air_date = ""
        vote_average = 0.0
    }
}

extension TvShow{
    var id: UUID{
        return UUID()
    }
}
