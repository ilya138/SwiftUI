//
//  DebugTabView.swift
//  inst
//
//  Created by ilya138 on 26.04.2023.
//

import SwiftUI

struct DebugTabView: View {
    
    var data: ModelData
    
    var body: some View {
        TabView {
            ScrollView{
                VStack {
                    Text("Posts: \(data.getFeed().count)")
                    Divider()
                    ForEach(data.getFeed()) { post in
                        VStack(alignment: .leading) {
                            Text("Post ID: " + String(describing: post.id))
                            Text("Sender: \(data.getUser(id: post.sender).name)")
                            Text("Sender ID: \(data.getUser(id: post.sender).id)")
                            Text("Sender Posts count: \(data.getUser(id: post.sender).posts.count)")
                            Divider()
                        }.font(.caption)
                    }
                }
                }.tag(0)
            ScrollView {
                VStack {
                    Text("Users: \(data.users.count)")
                    Divider()
                    ForEach(data.users) { user in
                        VStack(alignment: .leading) {
                            Text("user: \(user.name)")
                            Text("user ID: \(user.id)")
                            Text("user Posts count: \(user.posts.count)")
                            Divider()
                        }.font(.caption)
                    }
                }
            }.tag(1)
        }
        .tabViewStyle(.page)
    }
}

struct DebugTabView_Previews: PreviewProvider {
    static var previews: some View {
        DebugTabView(data: previewData())
    }
}
