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
    var adaptiveLayout = [GridItem(.adaptive(minimum: 100))]
    
    
    var body: some View {
            List{
                ForEach(tvShowVM.tvResponse.results) { tvshow in
                    HStack(alignment: .top, spacing: 10){
                        KFImage(URL(string: Api.getImageFor(path: tvshow.poster_path))!)
                            .resizable()
                            .frame(width: 100, height: 150, alignment: .leading)
                                                    
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(tvshow.original_name)")
                                .font(.title3).fontWeight(.bold)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                            Text("\(tvshow.overview)")
                                .font(.caption).fontWeight(.regular)
                                .foregroundColor(.gray)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .lineLimit(4)

                            Text("Release Date: \(tvshow.first_air_date)")
                                .font(.caption2).fontWeight(.semibold)
                                .foregroundColor(.gray)

                            Text("Average Note: \(tvshow.vote_average)")
                                .font(.caption2).fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Spacer()                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)

                        }.frame(maxWidth: .infinity,maxHeight:.infinity)

                    }
            }
        }
        
    }
    
}

struct TvShowView_Previews: PreviewProvider {
    static var previews: some View {
        //TvShowView()
        ContentView(tvShowVM: TvShowViewModel())
    }
}
