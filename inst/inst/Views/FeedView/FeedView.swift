//
//  FeedView.swift
//  inst
//
//  Created by ilya138 on 19.04.2023.
//

import SwiftUI

struct FeedView: View {
    
    @State var data: ModelData
    var currentPost: Post?
    
    var body: some View {
        ScrollViewReader { value in
            ScrollView {
                ForEach(data.getFeed()) {post in
                    VStack {
                        Divider()
                            .frame(height: 5)
                        PostView(post: post, data: data)
                    }
                }
            }
            .onAppear {
                if let jumpTo = currentPost {
                    value.scrollTo(jumpTo.id)
                }
            }
        }
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView(data: ContentView.ViewModel().data)
    }
}

struct ParentView: View {
    
    @State var data: ModelData
    
    var body: some View {
        NavigationView {
            ScrollView {
                FeedView(data: data)
            }
        }
    }
}
