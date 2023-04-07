//
//  MainView.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import SwiftUI

struct MainView: View {
    
    var data: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // Header
                HStack {
                    Text("SOMETHINgram")
                        .font(.title)
                    Spacer()
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                    Image(systemName: "plus.message")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27)
                        .padding(.leading, 10)
                }
                .padding(.horizontal)
                
                // Stories
                StoriesListView(data: data)
                
                // Posts
                ForEach(data.posts) {post in
                    VStack {
                        Divider()
                            .frame(height: 5)
                        PostView(post: post, data: data)
                        
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(data: ContentView.ViewModel().data)
    }
}
