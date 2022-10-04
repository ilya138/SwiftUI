//
//  TelegramToolbarBottom.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/15/22.
//

import SwiftUI

struct TelegramCircleImage: View {
    
    let image: String
    var colors: [Double] = [1, 0, 0]
    
    var body: some View {
        
        let upColor = Color(
            red: colors[0],
            green: colors[1],
            blue: colors[2])
        let downColor = upColor.opacity(0.8)
        
        Circle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [upColor, downColor]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .overlay {
                Image(systemName: image)
                    .foregroundColor(.black)
                    .shadow(radius: 5)
            }
    }
}

struct TelegramCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        TelegramCircleImage(image: "pencil")
    }
}
