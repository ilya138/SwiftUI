//
//  NotificationsView.swift
//  inst
//
//  Created by ilya138 on 26.04.2023.
//

import SwiftUI

struct NotificationsView: View {
    
    var data: ModelData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Today")
                    .font(.title3)
                    .bold()
                ForEach(data.notifications) { notification in
                    NotificationRowView(notification: notification, data: data)
                }
                
                Divider()
                //Text("This Week").font(.title3).bold()
                //Divider()
                //Text("This Month").font(.title3).bold()
                //Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct NotificationRowView: View {
    
    var notification: Notification
    var data: ModelData
    
    var size: CGFloat = 45
    var body: some View {
        HStack {
            
            NavigationLink {
                ProfileView(data: data, user: notification.user)
            } label: {
                HStack {
                    ProfileCircle(size: size, user: notification.user)
                        .frame(width: size, height: size)
                    Text("**\(notification.user.login)** \(notification.text)")
                        .font(.caption)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .tint(.primary)
                    Text("22h")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            Spacer()
            if notification.type == .follow {
                if data.currentUser.following.contains(notification.user) {
                    Button {
                        //
                    } label: {
                        Text("Following")
                            .font(.caption)
                            .padding(.horizontal, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    .accentColor(.gray)
                } else {
                    Button {
                        //
                    } label: {
                        Text("Follow")
                            .font(.caption)
                            .padding(.horizontal)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            } else if let post = notification.post {
                // Post image
                NavigationLink {
                    PostView(post: post, data: data)
                } label: {
                    Image(post.getImage())
                        .resizable()
                        .frame(width: size, height: size)
                        .aspectRatio(contentMode: .fill)
                        
                }
            }
        }
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(data: previewData())
    }
}
