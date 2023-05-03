//
//  MainView.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import SwiftUI

struct FeedTabView: View {
    
    var data: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // Header
                HStack {
                    Text("SOMETHINgram")
                        .font(.title)
                    Spacer()
                    NavigationLink(destination: NotificationsView(data: data)) {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .tint(.primary)
                    }
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
                FeedView(data: data)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        FeedTabView(data: ContentView.ViewModel().data)
    }
}
