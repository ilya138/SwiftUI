//
//  TelegramArchivedChatView.swift
//  SwiftUIViewsPlayground
//
//  Created by ilya138 on 9/25/22.
//

import SwiftUI

struct TelegramArchivedChatView: View {

    @State private var searchText = ""
    @State var refresh = false
    @ObservedObject var model = viewModel
    @State var selection = Set<String>()
    
    var body: some View {
        
        List(selection: $selection) {
            
            ForEach(viewModel.archivedChats) {chat in
                
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
        .navigationTitle("Archived Chats")
        .refreshable {
            refresh.toggle()
            print("chat refresh")
        }
    }
}

struct ArchivedChatsRow: View {
    
    var body: some View {
        NavigationLink {
            TelegramArchivedChatView()
        } label: {
            TelegramArchivedChatRow()
        }
        .listRowBackground(Color.gray.opacity(0.2))
        .swipeActions(edge: .trailing) {
            
            Button {
                //
            } label: {
                Label("Hide", systemImage: "tray.and.arrow.up.fill")
                
            }
        }
    }
}

struct TelegramArchivedChatRow: View {
    
    @ObservedObject var model = viewModel
    
    var body: some View {
        HStack {
            
            TelegramCircleImage(image: "tray.full.fill",
                                colors: [0,0,1])
                .frame(width: 55, height: 55)
            VStack(alignment: .leading) {
                HStack {
                    Text("Archived Chats")
                        .font(.headline)
                        .padding(.bottom, 3)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.archivedChatsPresentation)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer()
                    if 10 > 0 {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .overlay {
                                Text(String(10))
                                    .font(.caption)
                            }
                    }
                }
            }
        }
    }
}

struct TelegramArchivedChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TelegramArchivedChatView()
        }
    }
}
