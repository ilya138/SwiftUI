//
//  LikeActionView.swift
//  TattooFonts
//
//  Created by ilya138 on 03.05.2023.
//

import SwiftUI

struct LikeActionView: View {
    
    var model: ViewModel
    var font: FontItem
    
    var body: some View {
        Button {
            withAnimation {
                model.likeFont(font: font)
            }
        } label: {
            if font.liked {
                Label("Unlike", systemImage: "heart.fill")
            } else {
                Label("Like", systemImage: "heart")
                    .foregroundColor(.red)
            }
        }
    }
}
