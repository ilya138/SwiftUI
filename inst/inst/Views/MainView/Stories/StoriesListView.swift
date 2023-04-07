//
//  StoriesListView.swift
//  inst
//
//  Created by Admin on 05.04.2023.
//

import SwiftUI

struct StoriesListView: View {
    
    var data: ModelData
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // Current user
                VStack {
                    ProfileCircle(user: data.currentUser)
                        .overlay {
                            ZStack {
                                Circle()
                                    .fill(.background)
                                    .frame(width: 30)
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.blue)
                                
                            }.offset(x: 22, y: 22)
                        }
                    Text("Your story")
                        .font(.caption)
                }
                .padding(.trailing, 5)
                
                // Followers
                ForEach(data.getUserStoriesList()) {user in
                    StoryListItemView(user: user, data: data)
                    
                }
            }
        }
        .padding(.horizontal)
    }
}


struct StoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesListView(data: ContentView.ViewModel().data)
    }
}
