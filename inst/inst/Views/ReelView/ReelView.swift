//
//  ReelView.swift
//  inst
//
//  Created by ilya138 on 19.04.2023.
//

import SwiftUI
import AVKit

struct ReelView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var reel: Post
    
    var body: some View {
        ZStack {
            VideoPlayerView(reel: $reel)
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {

                        // Profile
                        HStack {
                            DefaultCircleImage(size: 40, imageName: reel.sender.profilePic)
                            Text("**\(reel.sender.login)**")
                        }
                        .padding(.bottom, 5)

                        // Description
                        Text(reel.description)
                            .padding(.bottom, 5)
                            .lineLimit(2)

                        // Likes
                        HStack {
                            Text("Liked by")
                                .font(.caption)
                                .foregroundColor(.white)
                        }

                        // Music
                        HStack {
                            Image(systemName: "music.note")
                            Text("\(reel.sender.login) · Original audio")
                        }
                        .padding(.vertical)
                    }
                    Spacer()
                    VStack {
                        // Likes
                        Button {
                            reel.likeDislike()
                        } label: {
                            Image(systemName: reel.liked ? "heart.fill" : "heart" )
                                .resizable()
                                .frame(width: 30, height: 28)
                        }
                        Text("\(reel.likes)")
                            .font(.caption)
                            .padding(.bottom)

                        // Comments
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("\(reel.comments.count)")
                            .font(.caption)
                            .padding(.bottom)

                        // Shares
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("\(reel.shares)")
                            .font(.caption)
                        Image(systemName: "ellipsis")
                            .padding(.vertical)
                        Image(reel.sender.profilePic)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            //.border(.white)
                            .padding(.bottom, 5)
                    }
                }
            }
            .foregroundColor(.white)
            .padding()
        }
        .navigationTitle("Reels")
        .ignoresSafeArea(.all)
        .tint(.white)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //
                } label: {
                    Image(systemName: "camera")
                        .foregroundColor(.white)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.white)
                }
            }

        }
    }
}

struct VideoPlayerView: View {
    
    @Binding var reel: Post
    @State var player = AVPlayer()
    
    var body: some View {
        
        VideoPlayer(player: player)
            .onAppear {
                player = AVPlayer(url: Bundle.main.url(forResource: reel.getImage(), withExtension: "mp4")!)
                player.play()
                player.externalPlaybackVideoGravity = .resizeAspectFill
                player.volume = 100
                addObserver()
            }
            .onDisappear {
                removeObserver()
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem,
                                               queue: nil) { notif in
            player.seek(to: .zero)
            player.play()
        }
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name: .AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
        
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            //NavigationStack {
                ReelView(reel: ContentView.ViewModel().data.currentUser.reels.first!)
            //}
        }
    }
}
