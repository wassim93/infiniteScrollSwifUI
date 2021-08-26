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
    
    
    
    func searchTxt(searchKey:String){
        self.loading = true

        print(searchKey)
        if !searchKey.isEmpty {
            NetworkManager<TvResponse>.fetch(for: URL(string: Api.getSearchUrl(query: searchKey))!) { (result) in
                switch result{
                    case .success(let response) :
                        DispatchQueue.main.async {
                            self.tvResponse = response
                            self.loading = false
                            
                            //if self.page != self.tvResponse.total_pages{
                           //     self.page += 1
                           // }
                        }
                    case .failure(let err):
                        print(err)
                }
            }
        }
        getTvShows()
     
    }
    
    
    func getOverviewFor(overview:String) -> String {
        if overview.isEmpty{
            return "No Overview Available"
        }
        return overview
    }
    
    func getTitleFor(title:String) -> String {
        if title.isEmpty{
            return "No Title Available"
        }
        return title
    }
    
    func getNoteFor(note:Double) -> String {
        
        return String(format: "%.1f", note)
    }
    
    
    
    func getTvShows(){
        self.loading = true
        NetworkManager<TvResponse>.fetch(for: URL(string: Api.getPopularUrl(page: page))!) { (result) in
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
