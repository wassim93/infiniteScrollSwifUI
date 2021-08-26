//
//  TvShowView.swift
//  InfiniteScrollExample
//
//  Created by wassim on 24/8/2021.
//

import SwiftUI
import Kingfisher

struct TvShowView: View {
    @ObservedObject var tvShowVM : TvShowViewModel
    @State var indexPathToSetVisible : IndexPath?

    
    
    var body: some View {
            List{
                ForEach(tvShowVM.tvResponse.results) { tvshow in
                    if tvshow == tvShowVM.tvResponse.results.last{
                        cellSetup(tv: tvshow, isLoading: true,vm: tvShowVM)
                    }else{
                        cellData(tv: tvshow)
                    }
                }
            }.overlay(ScrollManagerView(indexPathToSetVisible: $indexPathToSetVisible).allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/).frame(width: 0, height: 0))
    }
    
    
fileprivate func cellSetup(tv:TvShow,isLoading:Bool,vm:TvShowViewModel) -> some View {
          VStack{
            cellData(tv: tv)
            LoaderIndicator(isAnimating: true, style: .large)
                .frame(width: 50, height: 50,alignment: .center)
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        vm.getTvShows()
                    }
                })
          }
        
    }
}

fileprivate func cellData(tv: TvShow) -> some View{
     HStack(alignment: .top, spacing: 10){
        KFImage(URL(string: Api.getImageFor(path: tv.poster_path ?? ""))!)
            .resizable()
            .frame(width: 100, height: 150, alignment: .leading)
        
        VStack(alignment: .leading, spacing: 10) {
            Text("\(tv.original_name ?? "")")
                .font(.title3).fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
            Text("\(tv.overview ?? "")")
                .font(.caption).fontWeight(.regular)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .lineLimit(4)
            
            Text("Release Date: \(tv.first_air_date ?? "")")
                .font(.caption2).fontWeight(.semibold)
                .foregroundColor(.gray)
            
            Text("Average Note: \(tv.vote_average ?? 0.0)")
                .font(.caption2).fontWeight(.semibold)
                .foregroundColor(.gray)
            Spacer().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }.frame(maxWidth: .infinity,maxHeight:.infinity)
    }
}



func loaderView(vm:TvShowViewModel) -> some View {
    HStack{
        Spacer()
        LoaderIndicator(isAnimating: vm.loading, style: .large)
            .frame(width: 50, height: 50,alignment: .center)
        Spacer()
        
    }.padding()

}

struct TvShowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
