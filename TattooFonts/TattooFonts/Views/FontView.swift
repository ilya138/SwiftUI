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
    
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    
    var body: some View {
        VStack {
            Spacer()
            //renderedImage
            //    .resizable()
            TextView(text: text, font: font, textAlignment: $textAlignment, bolded: $bolded)
            Spacer()
            HStack {
                Button { withAnimation { textAlignment = .leading }}
                    label: {Image(systemName: "text.alignleft").resizable().padding(10)}
                Button { withAnimation { textAlignment = .center }}
                    label: {Image(systemName: "text.aligncenter").resizable().padding(10)}
                Button { withAnimation { textAlignment = .trailing }}
                    label: {Image(systemName: "text.alignright").resizable().padding(10)}
                Divider()
                Button { withAnimation {bolded.toggle() }}
                    label: {Image(systemName: "bold").resizable().padding(10)}
            }.frame(width: 250, height: 50)
                .foregroundColor(.primary)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                ShareLink(item: renderedImage, preview: SharePreview("Preview", image: renderedImage))
            }
        }
        .onAppear {
            let renderer = ImageRenderer(content: TextView(text: text, font: font, textAlignment: $textAlignment, bolded: $bolded))

           // make sure and use the correct display scale for this device
            renderer.scale = displayScale

            if let uiImage = renderer.uiImage {
                renderedImage = Image(uiImage: uiImage)
            }
        }
    }
}

struct TextView: View {
    
    var text: String
    var font: String
    
    @Binding var textAlignment: TextAlignment
    @Binding var bolded: Bool
    
    var body: some View {
        Text(text)
            .font(Font.custom(font, size: 550))
            .lineLimit(2)
            .minimumScaleFactor(0.05)
            .padding()
            .multilineTextAlignment(textAlignment)
            .bold(bolded)
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FontView(text: """
                     Text
                     Text32
                     """, font: "Arial")
        }
    }
}
