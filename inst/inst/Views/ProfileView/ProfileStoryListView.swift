//
//  ProfileStoryListView.swift
//  inst
//
//  Created by ilya138 on 17.04.2023.
//

import SwiftUI

struct ProfileStoryListView: View {
    
    var user: User
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // Story groups
                ForEach(user.storyGroups) {group in
                    ProfileStoryItemView(group: group, user: user)
                }
            }
        }
    }
}

struct ProfileStoryListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStoryListView(user: ContentView.ViewModel().data.currentUser)
    }
}
