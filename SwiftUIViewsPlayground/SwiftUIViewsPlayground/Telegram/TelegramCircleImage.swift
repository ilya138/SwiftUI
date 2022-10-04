//
//  TelegramToolbarBottom.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/15/22.
//

import SwiftUI

struct TelegramContactImage: View {
    let image: String
    let colorShade = Double.random(in: 0.5...1)
    var body: some View {
        Circle()
            .frame(width: 55, height: 55)
            .opacity(Double.random(in: 0.2...1))
            .foregroundColor(
                Color(
                    red: colorShade,
                    green: colorShade,
                    blue: colorShade
                ))
            .overlay {
                Image(systemName: image)
                    .foregroundColor(.black)
                    .shadow(radius: 5)
            }
    }
}

struct TelegramContactImage_Previews: PreviewProvider {
    static var previews: some View {
        TelegramContactImage(image: "pencil")
    }
}
