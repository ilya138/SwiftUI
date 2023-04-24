//
//  ProfileCircle.swift
//  inst
//
//  Created by Admin on 03.04.2023.
//

import SwiftUI

struct ProfileCircle: View {
    
    var size: CGFloat = 70
    var user: User
    var showStoryIndicator = true
    
    var body: some View {
        ZStack {
            if !user.stories.isEmpty {
                if user.hasUnwatchedStories() {
                    NotWatchedStoryCircleView(size: size, imageName: user.profilePic)
                } else {
                    WatchedStoryCircleView(size: size, imageName: user.profilePic)
                }
                
            } else {
                Image(user.profilePic)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: size, height: size)
            }

        }
    }
}

struct WatchedStoryCircleView: View {
    
    var size: CGFloat = 70
    var imageName: String
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(.gray, lineWidth: 1)
                .frame(width: size)
            
            DefaultCircleImage(size: size, imageName: imageName)
        }
    }
}

struct NotWatchedStoryCircleView: View {
    
    var size: CGFloat = 70
    var imageName: String
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center),
                    lineWidth: 3)
                .frame(width: size)
            
            DefaultCircleImage(size: size, imageName: imageName)
        }
    }
}

struct DefaultCircleImage: View {
    
    var size: CGFloat = 70
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .frame(width: size - 7, height: size - 7)
    }
}

struct ProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircle(user: ContentView.ViewModel().data.users[0])
    }
}
