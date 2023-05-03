//
//  ContentView.swift
//  TattooFonts
//
//  Created by ilya138 on 29.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = "Tattoo Text"
    @State private var size: Int = 40
    
    @State var likedOnly = false
    @State var showSettings = false
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack(alignment: .center) {
                    TextField("Enter text", text: $text, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(2)
                }
                .padding()
                
                List(model.getFonts(likedOnly), id:\.name) { font in
                    
                    NavigationLink(destination: FontView(text: text, font: font.name)) {
                        FontItemRowView(text: text, font: font)
                    }
                    // Like
                    .swipeActions(edge: .leading) {
                        LikeActionView(model: model, font: font)
                    }
                    // Delete
                    .swipeActions(edge: .trailing) {
                        DeleteActionView(model: model, font: font)
                    }
                }
                .listStyle(.plain)
                
                .overlay(alignment: .bottomTrailing) {
                    FilterButtonView(likedOnly: $likedOnly)
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
