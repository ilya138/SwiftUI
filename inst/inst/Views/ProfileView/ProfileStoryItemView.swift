//
//  ProfileStoryItemView.swift
//  inst
//
//  Created by ilya138 on 17.04.2023.
//

import SwiftUI

struct ProfileStoryItemView: View {
    
    var group: StoryGroup
    var user: User
    @State private var viewingStories = false
    
    var body: some View {
        VStack {
            WatchedStoryCircleView(size: 65, imageName: group.image)
            Text(group.name)
                .font(.caption)
                .lineLimit(1)
                .frame(maxWidth: 70)
        }
        .onTapGesture {
            viewingStories = true
        }
        .fullScreenCover(isPresented: $viewingStories) {
            //UserStoriesView(user: user, data: data, isShown: $viewingStories)
        }
        .padding(.horizontal, 5)
        .padding(.top, 3)
    }
    
}

struct ProfileStoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStoryItemView(group: ContentView.ViewModel().data.currentUser.storyGroups[0], user: ContentView.ViewModel().data.currentUser)
    }
}
