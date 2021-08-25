//
//  TvShowViewModel.swift
//  InfiniteScrollExample
//
//  Created by wassim on 25/8/2021.
//

import SwiftUI


class TvShowViewModel: ObservableObject {
    @Published var tvResponse = TvResponse(p: 1)
    
    
    init() {
        getTvShows(page: tvResponse.page)
    }
    
    
    
     func getTvShows(page:Int){
        NetworkManager<TvResponse>.fetch(for: URL(string: Api.getUrlFor(page: page))!) { (result) in
            switch result{
                case .success(let response) :
                    DispatchQueue.main.async {
                        self.tvResponse = response
                    }
                case .failure(let err):
                    print(err)
            }
        }
    }
    
    
}
