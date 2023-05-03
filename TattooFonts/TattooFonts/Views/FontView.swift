//
//  FontView.swift
//  TattooFonts
//
//  Created by ilya138 on 01.05.2023.
//

import SwiftUI

struct FontView: View {
    
    var text: String
    var font: String
    
    @State var textAlignment: TextAlignment = .center
    @State var bolded = false
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(Font.custom(font, size: 550))
                .lineLimit(2)
                .minimumScaleFactor(0.05)
                .padding()
                .multilineTextAlignment(textAlignment)
                .bold(bolded)
            Spacer()
            HStack {
                Button { textAlignment = .leading } label: {Image(systemName: "text.alignleft").resizable().padding(10)}
                Button { textAlignment = .center} label: {Image(systemName: "text.aligncenter").resizable().padding(10)}
                Button { textAlignment = .trailing} label: {Image(systemName: "text.alignright").resizable().padding(10)}
                Divider()
                Button { bolded.toggle() } label: {Image(systemName: "bold").resizable().padding(10)}
            }.frame(width: 250, height: 50)
                .foregroundColor(.primary)
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(text: "Text", font: "Arial")
    }
}
