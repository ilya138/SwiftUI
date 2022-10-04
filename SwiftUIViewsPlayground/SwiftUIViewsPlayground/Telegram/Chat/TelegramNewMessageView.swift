//
//  TelegramNewMessageView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/20/22.
//

import SwiftUI

struct TelegramNewMessageView: View {
    
    @Binding var isShown: Bool
    @State var searchText: String = ""
    
    var body: some View {
        List {
            NavigationLink {
                //
            } label: {
                Label("New Group", systemImage: "person.2")
                    .foregroundColor(.gray)
            }
            NavigationLink {
                //
            } label: {
                Label("New Contact", systemImage: "person.badge.plus")
                    .foregroundColor(.gray)
            }
            NavigationLink {
                //
            } label: {
                Label("New Channel", systemImage: "speaker.3")
                    .foregroundColor(.gray)
            }
                
            
            ForEach(viewModel.contacts) {contact in
                Section(header: Text(contact.name.prefix(1))) {
                    TelegramContactRow(contact: contact)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.grouped)
        .refreshable {
            // pass
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    isShown = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(.gray)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("New Message")
            }
        }
    }
}

struct TelegramNewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramNewMessageView_PreviewContainer()
    }
}

struct TelegramNewMessageView_PreviewContainer: View {
    @State var newChat = false
    var body: some View {
        NavigationView {
            TelegramNewMessageView(isShown: $newChat)
        }
    }
}
