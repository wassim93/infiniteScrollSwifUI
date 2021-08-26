//
//  TvShow.swift
//  InfiniteScrollExample
//
//  Created by wassim on 23/8/2021.
//

import Foundation


struct TvShow: Codable,Identifiable,Equatable {
    var original_name: String?
    var poster_path: String?
    var first_air_date: String?
    var vote_average: Double?
    var overview: String?
    
    enum CodingKey : String {
        case original_name
        case poster_path
        case first_air_date
        case vote_average
        case overview
    }
    
    init() {
        original_name = ""
        poster_path = ""
        first_air_date = ""
        vote_average = 0.0
        overview = ""
    }
}

extension TvShow{
    var id: UUID{
        return UUID()
    }
}


