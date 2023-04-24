//
//  ProfileView.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import SwiftUI

enum ProfileTabs {
    case posts
    case reels
    case tags
}

struct ProfileView: View {
    
    var data: ModelData
    var user: User
    
    @State var currentTab = ProfileTabs.posts
    
    var body: some View {
        
        VStack {
            // Header
            ProfileHeaderToolbarView(data: data)
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    
                    // Avatar, followers, description
                    ProfileHeaderView(data: data)
                        .padding(.horizontal)
                    
                    // Stories
                    ProfileStoryListView(user: data.currentUser)
                        .padding(.vertical, 5)
                    
                    // Posts/Reels/Tags tabs
                    Picker("Appearance", selection: $currentTab) {
                        Image(systemName: "grid").tag(ProfileTabs.posts)
                        Image(systemName: "play.square").tag(ProfileTabs.reels)
                        Image(systemName: "person.crop.square").tag(ProfileTabs.tags)
                    }
                    .pickerStyle(.segmented)
                    //.frame(height: 20)
                    
                    
                    // Tabs
                    TabView(selection: $currentTab) {
                        
                        // Posts
                        ProfileViewTabPosts(data: data, user: user)
                        
                        // Reels
                        ProfileViewTabReels(data: data)
                        
                        // Tags
                        ProfileViewTabTags(data: data)
                        
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(minHeight: CGFloat(data.currentUser.posts.count / 3 * 100) + 250)
                }
                
            }
        }
        .padding(.top, 1)
    }
}

struct ProfileHeaderToolbarView: View {
    
    var data: ModelData
    @State var profileSelectionShown = false
    @State var addActionsShown = false
    @State var moreActionsShown = false
    
    var body: some View {
        HStack {
            // Add accounts
            Button {
                profileSelectionShown.toggle()
            } label: {
                Text("**\(data.currentUser.login)**")
                    .font(.title)
            }
            
            Spacer()
            // Add actions sheet
            Button {
                addActionsShown.toggle()
            } label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
            }
            
            // More actions
            Button {
                moreActionsShown.toggle()
            } label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27)
                    .padding(.leading, 10)
            }
        }
        .sheet(isPresented: $profileSelectionShown) {
            ProfileSelectionSheet(data: data, profileSelectionShown: profileSelectionShown)
        }
        .sheet(isPresented: $addActionsShown) {
            AddActionsSheet()
        }
        .sheet(isPresented: $moreActionsShown) {
            MoreActionsSheet()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .tint(.primary)
    }
}

struct ProfileHeaderView: View {
    
    @State var data: ModelData
    
    var body: some View {
        
        HStack {
            ProfileCircle(size: 90, user: data.currentUser)
                .padding(.top, 10)
            
            Spacer()
            
            Group {
                VStack {
                    Text(String(data.currentUser.posts.count))
                    Text("Posts")
                }
                VStack {
                    Text(String(data.currentUser.followers))
                    Text("Followers")
                }
                .padding(.horizontal)
                VStack {
                    Text(String(data.currentUser.following))
                    Text("Folllowing")
                }
            }
            .font(.body)
        }
        
        
        Text("**\(data.currentUser.name)**")
            .font(.body)
        Text(data.currentUser.description)
            .font(.body)
            .padding(.bottom, 20)
        
        HStack {
            Button {
                
            } label: {
                Text("Edit profile")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 2)
            }.buttonStyle(.bordered)
            
            Button {
                
            } label: {
                Text("Share profile")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 2)
            }.buttonStyle(.bordered)
        }
        .tint(.primary)
        .frame(maxWidth: .infinity)
        
    }
}



struct ProfileView_Previews: PreviewProvider {
    
    static var data = ContentView.ViewModel().data
    static var previews: some View {
        NavigationView {
            ScrollView {
                ProfileView(data: data, user: data.currentUser)
            }
        }
    }
    
}

