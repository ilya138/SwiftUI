//
//  StoryListItemView.swift
//  inst
//
//  Created by Admin on 06.04.2023.
//

import SwiftUI

struct StoryListItemView: View {
    
    var user: User
    var data: ModelData
    @State private var viewingStories = false
    
    var body: some View {
        VStack {
            ProfileCircle(user: user)
            Text(user.name)
                .font(.caption)
                .lineLimit(1)
                .frame(maxWidth: 70)
        }
        .onTapGesture {
            viewingStories = true
        }
        .fullScreenCover(isPresented: $viewingStories) {
            UserStoriesView(user: user, data: data, isShown: $viewingStories)
        }
        .padding(.horizontal, 5)
        .padding(.top, 3)
    }
}

struct StoryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListItemView(user: ContentView.ViewModel().data.users[0], data: ContentView.ViewModel().data)
    }
}
