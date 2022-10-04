//
//  TelegramChatsView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/15/22.
//

import SwiftUI

struct TelegramChatsView: View {
    
    @State private var searchText = ""
    @ObservedObject var model = viewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.chats) {chat in
                    var tmpchat = chat
                    NavigationLink {
                        TelegramChatView(chat: tmpchat)
                    } label: {
                        TelegramMainChatRow(chat: tmpchat)
                    }
                }
                .onDelete(perform: deleteChat)
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchText, prompt: "Search for messages or users")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // top
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Edit") {
                        print("Edit")
                    }
                    .foregroundColor(.gray)
                }
                ToolbarItem(placement: .principal) {
                    Text("Chats")
                        .fixedSize()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    func deleteChat(at offsets: IndexSet) {
        viewModel.chats.remove(atOffsets: offsets)
    }
    
}

struct TelegramChatsView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramChatsView()
    }
}
