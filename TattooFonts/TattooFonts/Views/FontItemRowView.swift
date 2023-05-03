//
//  FontItemRowView.swift
//  TattooFonts
//
//  Created by ilya138 on 03.05.2023.
//

import SwiftUI

struct FontItemRowView: View {
    
    var text: String
    var font: FontItem
    let size: CGFloat = 40
    
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(width: 3)
                .foregroundColor(font.liked ? .red : .secondary)
            Text(text)
                .font(Font.custom(font.name, size: size))
                .lineLimit(1)
        }
    }
}
