//
//  LoaderIndicator.swift
//  InfiniteScrollExample
//
//  Created by wassim on 26/8/2021.
//

import SwiftUI


struct LoaderIndicator: UIViewRepresentable {
    
    @Binding var isAnimating:Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<LoaderIndicator>) ->  UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoaderIndicator>) {
        if isAnimating {
            uiView.startAnimating()
        }else{
            uiView.stopAnimating()
        }
    }
}

