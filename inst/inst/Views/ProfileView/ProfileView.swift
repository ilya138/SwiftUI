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
        
        NavigationView {
            VStack {
                // Header
                ProfileHeaderToolbarView(data: data, user: user)
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        // Avatar, followers, description
                        ProfileHeaderView(data: data, user: user)
                            .padding(.horizontal)
                        
                        // Stories
                        ProfileStoryListView(user: user)
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
                            ProfileViewTabReels(data: data, user: user)
                            
                            // Tags
                            ProfileViewTabTags(data: data, user: user)
                            
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .frame(minHeight: CGFloat(user.posts.count / 3 * 100) + 250)
                    }
                    
                }
            }
            .padding(.top, 1)
        }
    }
}

struct ProfileHeaderToolbarView: View {
    
    var data: ModelData
    var user: User
    @State var profileSelectionShown = false
    @State var addActionsShown = false
    @State var moreActionsShown = false
    
    var body: some View {
        HStack {
            // Add accounts
            Button {
                profileSelectionShown.toggle()
            } label: {
                Text("**\(user.login)**")
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
    var user: User
    
    var body: some View {
        
        HStack {
            ProfileCircle(size: 90, user: user)
                .padding(.top, 10)
            
            Spacer()
            
            Group {
                VStack {
                    Text(String(user.posts.count))
                    Text("Posts")
                }
                VStack {
                    Text(String(user.followers(users: data.users).count))
                    Text("Followers")
                }
                .padding(.horizontal)
                VStack {
                    Text(String(user.following.count))
                    Text("Folllowing")
                }
            }
            .font(.body)
        }
        
        
        Text("**\(user.name)**")
            .font(.body)
        Text(user.description)
            .font(.body)
            .padding(.bottom, 20)
        
        if user == data.currentUser {
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
}



struct ProfileView_Previews: PreviewProvider {
    
    static var data = ContentView.ViewModel().data
    static var previews: some View {
        NavigationView {
            ScrollView {
                ProfileView(data: data, user: data.users.randomElement()!)
            }
        }
    }
    
}

