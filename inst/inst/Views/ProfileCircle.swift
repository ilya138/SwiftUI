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
                    Circle()
                        .stroke(
                            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center),
                            lineWidth: 3)
                        .frame(width: size)
                } else {
                    Circle()
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: size)
                }
                
                Image(user.profilePic)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: size - 10, height: size - 10)
            } else {
                Image(user.profilePic)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: size, height: size)
            }

        }
    }
}

struct ProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCircle(user: ContentView.ViewModel().data.users[0])
    }
}
