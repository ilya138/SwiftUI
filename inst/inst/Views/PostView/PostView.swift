//
//  PostView.swift
//  inst
//
//  Created by Admin on 03.04.2023.
//

import SwiftUI

struct PostView: View {
    
    @State var post: Post
    var data: ModelData
    
    @State var actionsShown = false
    @State var shareToShown = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                ProfileCircle(size: 40, user: post.sender)
                VStack(alignment: .leading) {
                    Text(post.sender.name)
                    if post.location != "" {
                        Text(post.location)
                            .font(.caption)
                    }
                }
                Spacer()
                Button {
                    actionsShown = true
                } label: {
                    Image(systemName: "ellipsis")
                        .accentColor(.primary)
                }
                .sheet(isPresented: $actionsShown) {
                    NavigationStack {
                        Spacer()
                        HStack {
                            GroupBox {
                                Button {
                                    //report
                                } label: {
                                    Label("Save", systemImage: "bookmark")
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            }
                            GroupBox {
                                Button {
                                    //report
                                } label: {
                                    Label("Remix", systemImage: "goforward.plus")
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            }
                           
                        }
                        .padding(.horizontal)
                        .accentColor(.primary)
                        .font(.title3)
                        GroupBox {
                            VStack(alignment: .leading) {
                                
                                Button {
                                    //report
                                } label: {
                                    Label("QR code", systemImage: "qrcode.viewfinder")
                                        .font(.title3)
                                }
                                Divider()
                                Button(role: .destructive) {
                                    //report
                                } label: {
                                    Label("Report", systemImage: "exclamationmark.bubble.fill")
                                        .font(.title3)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .accentColor(.primary)
                    }
                    
                    .presentationDetents([.height(220)])
                }
            }.padding(.horizontal, 10.0)
            
            // Image
            Image(post.image)
                .resizable()
                .frame(height: 400)
                .foregroundColor(Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
            
            
            //
            HStack {
                // Like button
                Button {
                    post.likeDislike()
                } label: {
                    Image(systemName: post.liked ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .padding(.trailing, 10)
                        .foregroundColor(post.liked ? Color.red : Color.primary)
                }
                
                // Comment button
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.trailing, 10)
                
                // Share button
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { _ in
                                shareToShown = true
                            }
                            .onEnded { _ in
                                shareToShown = false
                            })
                    .overlay {
                        if shareToShown {
                            ShareToView(data: data)
                                .offset(x: 80, y: -50)
                        }
                    }
                
                Spacer()
                
                // Bookmark button
                Image(systemName: "bookmark")
                    .resizable()
                    //.aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 20)
                    .padding(.trailing, 20)
            }
            .padding(.leading)
            .padding(.top, 5)
            
            // likes count
            Text("\(post.likes) likes")
                .padding(.horizontal)
            
            // description
            Text("**\(post.sender.name)** \(post.description)")
                .padding(.horizontal)
                .lineLimit(2)
            
            // Add comment field
            if post.canComment {
                HStack {
                    ProfileCircle(size: 30, user: data.currentUser)
                    Text("Add a comment...")
                }
                .padding(.horizontal)
            }
            
            // date
            Text("6 February")
                .padding(.horizontal)
                .font(.caption)
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: ContentView.ViewModel().data.posts.randomElement()!,
                 data: ContentView.ViewModel().data)
    }
}
