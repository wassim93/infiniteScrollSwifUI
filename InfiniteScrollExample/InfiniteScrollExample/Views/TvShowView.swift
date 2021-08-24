//
//  TvShowView.swift
//  InfiniteScrollExample
//
//  Created by wassim on 24/8/2021.
//

import SwiftUI

struct TvShowView: View {
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 120, maximum: 200), spacing: 0),
            GridItem(.flexible(minimum: 120, maximum: 200), spacing: 0),
            GridItem(.flexible(minimum: 120, maximum: 200))

        ],spacing: 5){
            ForEach(0..<20,id: \.self){ num in
                VStack(alignment: .leading){
                    Spacer()
                        .frame(width: 115, height: 100)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    Text("\(num)")
                        .font(.system(size: 10,weight: .regular))
                        .foregroundColor(.gray)
                    Text("test2")
                        .font(.system(size: 9,weight: .regular))
                        .foregroundColor(.gray)
                    Text("ok")
                        .font(.system(size: 9,weight: .regular))
                        .foregroundColor(.gray)
                }.background(Color.red)
            }
        }
    }
}

struct TvShowView_Previews: PreviewProvider {
    static var previews: some View {
        //TvShowView()
        ContentView()
    }
}
