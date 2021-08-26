//
//  ContentView.swift
//  InfiniteScrollExample
//
//  Created by wassim on 23/8/2021.
//

import SwiftUI

struct ContentView: View {
    @State  var search = ""
    @ObservedObject var tvShowVM = TvShowViewModel()


    var body: some View {
            VStack{
                HeaderView(searchText: search, tvShowVM: tvShowVM)
                TvShowView(tvShowVM: tvShowVM)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
