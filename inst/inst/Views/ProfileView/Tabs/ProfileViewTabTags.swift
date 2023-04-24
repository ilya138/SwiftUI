//
//  ProfileViewTabTags.swift
//  inst
//
//  Created by ilya138 on 19.04.2023.
//

import SwiftUI

struct ProfileViewTabTags: View {
    
    var data: ModelData
    
    var body: some View {
        VStack {
            if data.currentUser.tags.count > 0 {
                // Show tags grid
                LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: .infinity), spacing: 1)], spacing: 1) {
                    ForEach(data.currentUser.tags) { post in
                        Image(post.getImage())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 50)
                Text("Photos and videos of you")
                    .font(.title)
                    .padding(5)
                Text("When people tag you in photos and videos, they'll appear here.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }.tag(ProfileTabs.tags)
    }
}

struct ProfileViewTabTags_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewTabTags(data: ContentView.ViewModel().data)
    }
}
