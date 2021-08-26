//
//  HeaderView.swift
//  InfiniteScrollExample
//
//  Created by wassim on 24/8/2021.
//

import SwiftUI

struct HeaderView: View {
    @State var searchText:String
    @ObservedObject var tvShowVM : TvShowViewModel

    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Popular Tv Show")
                .padding()
                .font(.system(size: 25,weight: .semibold))
            searchView().padding(.bottom)
        })
  
    }
    
    private func searchView() -> some View {
        HStack{
            TextField("Search ...", text: $searchText)
                .padding(10)
                .padding(.horizontal,10)
                .padding(.horizontal,10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }.padding([.horizontal],12).overlay(
            Image(systemName: "magnifyingglass")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading,20)
                .foregroundColor(.gray)
        )
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var search = ""

    static var previews: some View {
        //HeaderView(searchText: $search)
        ContentView()
    }
}
