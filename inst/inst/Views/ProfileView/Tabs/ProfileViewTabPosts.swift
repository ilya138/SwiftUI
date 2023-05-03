//
//  ProfileViewPostsTab.swift
//  inst
//
//  Created by ilya138 on 19.04.2023.
//

import SwiftUI

struct ProfileViewTabPosts: View {
    
    var data: ModelData
    var user: User
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 1), count: 3), spacing: 1) {
                ForEach(user.posts) { post in
                    NavigationLink {
                        FeedView(data: data, currentPost: post)
                            .navigationTitle("Posts")
                    } label: {
                        Image(post.getImage())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(alignment: .topTrailing) {
                                if post.images.count > 1 {
                                    Image(systemName: "square.fill.on.square.fill")
                                        .padding(5)
                                        .foregroundColor(.white)
                                }
                            }
                    }
                }
                    
            }
            Spacer()
        }.tag(ProfileTabs.posts)
    }
}

struct ProfileViewPostsTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileViewTabPosts(data: ContentView.ViewModel().data, user: ContentView.ViewModel().data.currentUser)
        }
    }
}
