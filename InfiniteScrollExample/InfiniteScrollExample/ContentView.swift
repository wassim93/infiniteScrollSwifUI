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
        
        ZStack{
            VStack{
                HeaderView(searchText: search, tvShowVM: tvShowVM)
                TvShowView(tvShowVM: tvShowVM)
            }
            //LoaderIndicator(isAnimating: $tvShowVM.loading, style: .large).frame(width: 50, height: 50,alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
