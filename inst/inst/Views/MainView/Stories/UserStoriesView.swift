//
//  UserStoriesView.swift
//  inst
//
//  Created by Admin on 06.04.2023.
//

import SwiftUI

struct UserStoriesView: View {
    
    var user: User
    var data: ModelData
    
    @Binding var isShown: Bool
    @State var commentText: String = ""
    @State var currentUser: user
    
    var body: some View {
        
        VStack {
            
            // Story view
            TabView(selection: $currentUser) {
                ForEach(data.getUserStoriesList()) { user in
                    UserStoryView(user: user, data: data, isShown: $isShown)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Footer
            HStack(alignment: .center) {
                TextField("Send message", text: $commentText)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Spacer()
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.horizontal, 5)
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.horizontal, 5)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
}

struct UserStoryView: View {
    
    var user: User
    var data: ModelData
    
    @Binding var isShown: Bool
    @State var currentStory = 0
    
    var body: some View {
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
