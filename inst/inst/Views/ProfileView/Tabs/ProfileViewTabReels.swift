//
//  ProfileViewReelsTab.swift
//  inst
//
//  Created by ilya138 on 19.04.2023.
//

import SwiftUI

struct ProfileViewTabReels: View {
    
    var data: ModelData
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: .infinity), spacing: 1)], spacing: 1) {
                ForEach(data.currentUser.reels) { reel in
                    NavigationLink {
                        ReelView(reel: reel)
                    } label: {
                        Image(uiImage: reel.getThumbnail()!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .clipped()
                            .aspectRatio(0.5, contentMode: .fit)
                            .overlay(alignment: .bottomLeading) {
                                Label("**\(reel.views)**", systemImage: "play")
                                    .foregroundColor(.white)
                                    .padding(10)
                            }
                    }
                }
            }
            Spacer()
        }.tag(ProfileTabs.reels)
    }
}

struct ProfileViewReelsTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileViewTabReels(data: ContentView.ViewModel().data)
        }
    }
}
