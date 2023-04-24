//
//  UserStoriesView.swift
//  inst
//
//  Created by Admin on 06.04.2023.
//

import SwiftUI

struct UserStoriesView: View {
    
    @State var user: User
    @State var currentStory = 0
    var data: ModelData
    
    @Binding var isShown: Bool
    

    var body: some View {
        
        // Story view
        TabView(selection: $user) {
            ForEach(data.getUserStoriesList()) { userSelection in
                UserStoryView(user: userSelection, data: data, isShown: $isShown, currentStory: currentStory)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct UserStoryView: View {
    
    @State var user: User
    var data: ModelData
    
    @Binding var isShown: Bool
    @State var currentStory = 0
    @State var commentText: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                // Story image
                Image(user.stories[currentStory].image)
                
                    .resizable()
                    .onTapGesture { location in
                        
                        if location.x > 250 {
                            // next story
                            if currentStory == user.stories.count-1 {
                                // close stories view
                                isShown = false
                            } else {
                                currentStory += 1
                            }
                        } else if location.x < 100 {
                            // previous story
                            currentStory = max(0, currentStory-1)
                        }
                        
                    }
                
                Spacer()
                
                // Story header
                VStack {
                    
                    // Progress bar
                    HStack {
                        ForEach(user.stories) { story in
                            ProgressView(value: 100, total: 100)
                                .tint(.secondary)
                                .scaleEffect(x: 1, y: 0.5)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal)
                    
                    
                    // Header
                    HStack {
                        ProfileCircle(size: 40, user: user, showStoryIndicator: false)
                        Text(user.name)
                            .padding(.horizontal, 5)
                        Spacer()
                        Button {
                            isShown.toggle()
                        } label: {
                            Image(systemName: "xmark")
                                .accentColor(.primary)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
            
            // Footer
            HStack(alignment: .center) {
                
                // Comment
                TextField("Send message", text: $commentText)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Spacer()
                
                // Like button
                LikeButtonView(story: user.stories[currentStory])
                
                // Share button
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.horizontal, 5)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        
    }
}

struct LikeButtonView: View {
    
    @State var story: Story
    
    var body: some View {
        Button {
            story.likeDislike()
        } label: {
            Image(systemName: story.liked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .padding(.horizontal, 5)
                .foregroundColor(story.liked ? Color.red : Color.primary)
        }
    }
}


struct UserStoriesView_ParentPreview: View {
    @State var isShown = false
    var body: some View {
        UserStoriesView(user: ContentView.ViewModel().data.users[0], data: ContentView.ViewModel().data, isShown: $isShown)
    }
}

struct UserStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        UserStoriesView_ParentPreview()
    }
}
