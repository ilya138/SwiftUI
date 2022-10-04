//
//  TelegramChatsView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/15/22.
//

import SwiftUI

struct TelegramChatsView: View {
    
    @State private var searchText = ""
    @Binding var newChat: Bool
    @State var refresh = false
    @ObservedObject var model = viewModel
    @State var selection = Set<String>()
    
    var body: some View {
        
        List(selection: $selection) {
            
            // Archived chats
            ArchivedChatsRow()
            
            ForEach(viewModel.nonArchivedChats) {chat in
                
                NavigationLink {
                    TelegramChatView(chat: chat)
                } label: {
                    TelegramMainChatRow(chat: chat)
                }
                .contextMenu {
                    ChatContextMenu(chat: chat)
                }
                
                .swipeActions(edge: .leading) {
                    ChatSwipeActionsLeading(chat: chat)
                }
                
                .swipeActions(edge: .trailing) {
                    ChatSwipeActionsTrailing(chat: chat)
                }
            }
        }
        .listStyle(PlainListStyle())
        .searchable(text: $searchText, prompt: "Search for messages or users")
        .navigationBarTitleDisplayMode(.inline)
        .refreshable {
            refresh.toggle()
            print("chat refresh")
        }
        .sheet(isPresented: $newChat) {
            NavigationView {
                TelegramNewMessageView(isShown: $newChat)
            }
        }
    }
    
}

struct ChatContextMenu: View {
    
    @State var chat: Chat
    
    var body: some View {
        // Mark as Unread
        Button {
            viewModel.readUnread(chat: chat)
        } label: {
            Label("Mark as Unread", systemImage: "message")
        }
        
        // Pin
        Button {
            viewModel.pinUnpin(chat: chat)
        } label: {
            if chat.pinned {
                Label("Unpin", systemImage: "pin.fill")
            } else {
                Label("Pin", systemImage: "pin.fill")
            }
        }
        
        // Mute
        Button {
            viewModel.muteUnmute(chat: chat)
        } label: {
            Label("Mute", systemImage: "speaker.slash")
        }
        
        // Delete
        Button(role: .destructive) {
            viewModel.deleteChat(chat: chat)
        } label: {
            Label("Delete", systemImage: "trash.fill")
        }
    }
}

struct ChatSwipeActionsLeading: View {
    
    @State var chat: Chat
    
    var body: some View {
        
        Button {
            viewModel.readUnread(chat: chat)
        } label: {
            Label("Unread", systemImage: "message")
        }
        
        Button {
            viewModel.pinUnpin(chat: chat)
        } label: {
            if chat.pinned {
                Label("Unpin", systemImage: "pin.fill")
            } else {
                Label("Pin", systemImage: "pin.fill")
            }
        }
        .tint(.green)
        
    }
}

struct ChatSwipeActionsTrailing: View {
    
    @State var chat: Chat
    
    var body: some View {
        
        // Archive
        Button {
            viewModel.archiveUnarchive(chat: chat)
        } label: {
            Label("Archive", systemImage: "archivebox.fill")
        }
        
        // Delete
        Button {
            viewModel.deleteChat(chat: chat)
        } label: {
            Label("Delete", systemImage: "trash.fill")
        }
        .tint(.red)
        
        // Mute
        Button {
            viewModel.muteUnmute(chat: chat)
        } label: {
            Label("Mute", systemImage: "speaker.slash")
        }
        .tint(.orange)
        
    }
}











struct TelegramChatsView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramChatsView_PreviewContainer()
    }
}

struct TelegramChatsView_PreviewContainer: View {
    @State var newChat = false
    var body: some View {
        NavigationView {
            TelegramChatsView(newChat: $newChat)
        }
    }
}
