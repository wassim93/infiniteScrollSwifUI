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

    var body: some View {
        ScrollView{
            LazyVStack{
                
                ForEach(tvShowVM.tvResponse.results.indices,id: \.self) { indexTv in
                    let tvshow = tvShowVM.tvResponse.results[indexTv]
                    cellData(tv: tvshow, vm: tvShowVM)
                    
                    if indexTv == tvShowVM.tvResponse.results.count - 1 {
                        cellLoader(vm: tvShowVM)
                    }
                }
            }
        }
        .padding(.horizontal)
        
    }
    
    
    func cellLoader(vm:TvShowViewModel) -> some View {
        VStack{
            LoaderIndicator(isAnimating: $tvShowVM.loading, style: .large).frame(width: 50, height: 50,alignment: .center)
                .onAppear {
                    print("reach last")
                    if vm.isSearching{
                        vm.performSearch(searchKey: vm.sKey)
                    }else{
                        vm.getTvShows()
                    }
                }
        }
    }
}

fileprivate func cellData(tv: TvShow, vm: TvShowViewModel) -> some View{
    HStack(alignment: .top, spacing: 10){
        KFImage(URL(string: Api.getImageFor(path: tv.poster_path ?? ""))!)
            .resizable()
            .frame(width: 100, height: 150, alignment: .leading)
        
        VStack(alignment: .leading, spacing: 5) {
            Text(vm.getTitleFor(title: tv.original_name!))
                .font(.title3).fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
            Text(vm.getOverviewFor(overview: tv.overview!))
                .font(.caption).fontWeight(.regular)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .lineLimit(4)
            
            Text("Release Date: \(tv.first_air_date ?? "")")
                .font(.footnote).fontWeight(.semibold)
                .foregroundColor(.red)
            
            Text("Note: \(vm.getNoteFor(note: tv.vote_average!))")
                .font(.footnote).fontWeight(.bold)
                .foregroundColor(.orange)
            Spacer().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        }.frame(maxWidth: .infinity,maxHeight:.infinity)
    }
}


struct TvShowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
