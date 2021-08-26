//
//  TvShowViewModel.swift
//  InfiniteScrollExample
//
//  Created by wassim on 25/8/2021.
//

import SwiftUI


class TvShowViewModel: ObservableObject {
    @Published var tvResponse = TvResponse()
    @Published var page = 1
    @Published var loading = false

    
    
    init() {
        getTvShows()
    }
    
    
    
     func getTvShows(){
        self.loading = true
        NetworkManager<TvResponse>.fetch(for: URL(string: Api.getUrlFor(page: page))!) { (result) in
            switch result{
                case .success(let response) :
                    DispatchQueue.main.async {
                        self.tvResponse.page = response.page
                        self.tvResponse.results =  self.tvResponse.results+response.results
                        self.tvResponse.total_pages = response.total_pages
                        self.loading = false

                        if self.page != self.tvResponse.total_pages{
                            self.page += 1
                        }
                    }
                case .failure(let err):
                    print(err)
            }
        }
    }
    
    
}
