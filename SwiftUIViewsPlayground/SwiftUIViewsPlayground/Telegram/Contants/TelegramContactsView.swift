//
//  TelegramContantsView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/15/22.
//

import SwiftUI

struct TelegramContactsView: View {
    
    @State private var searchText: String = ""
    @Binding var newContact: Bool
    @State var refresh = false
    
    @ObservedObject var model = viewModel
    
    var body: some View {
        List {
            NavigationLink {
                TelegramPeopleNearby()
            } label: {
                Label("Find People Nearby", systemImage: "mappin.and.ellipse")
                    .foregroundColor(.gray)
            }
            NavigationLink {
                // Invite
            } label: {
                Label("Invite Friends", systemImage: "person.badge.plus")
            }
            .foregroundColor(.gray)
            
            ForEach(viewModel.contacts) {contact in
                
                NavigationLink {
                    TelegramChatView(chat: contact.chat)
                } label: {
                    TelegramContactRow(contact: contact)
                }
                    
                .contextMenu {
                    ContactContextMenu(contact: contact)
                }
                
                .searchable(text: $searchText, prompt: "Search for users")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .listStyle(.plain)
        .refreshable {
            refresh.toggle()
        }
        .sheet(isPresented: $newContact) {
            NavigationView {
                NewContactView(isShown: $newContact)
            }
        }
    }
}

struct NewContactView: View {
    
    @Binding var isShown: Bool
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phone: String = "+"
    
    var body: some View {
            
            VStack(alignment: .leading) {
                HStack {
                    TelegramCircleImage(image: "ant")
                        .frame(width: 75, height: 75)
                        .padding()
                    VStack {
                        TextField("First Name", text: $firstName)
                        Divider()
                        TextField("Last Name", text: $lastName)
                    }
                }
                HStack {
                    Text("Mobile")
                    //Divider()
                    TextField("Phone", text: $phone)
                    
                }
                Divider()
                HStack {
                    Text("Add phone")
                }
                Divider()
                Spacer()
                
            }
            .padding()
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
                    Text("New contact")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let contact = Contact()
                        contact.name = firstName + " " + lastName
                        viewModel.contacts.append(contact)
                        isShown = false
                    } label: {
                        Text("Create")
                            .foregroundColor(.gray)
                    }
                }
            }
    }
}

struct ContactContextMenu: View {
    
    @State var contact: Contact
    
    var body: some View {
        // Mark as Unread
        NavigationLink {
            TelegramChatView(chat: contact.chat)
        } label: {
            Label("Send Message", systemImage: "message")
        }
        
        // Pin
        Button {
            //viewModel.pinUnpin(chat: chat)
        } label: {
            Label("Start Secret Chat", systemImage: "timer")
        }
        
        // Mute
        Button {
            //viewModel.muteUnmute(chat: chat)
        } label: {
            Label("Call", systemImage: "phone")
        }
        
        // Delete
        Button {
            //viewModel.deleteChat(chat: chat)
        } label: {
            Label("Video Call", systemImage: "video")
        }
    }
}



struct TelegramContactsView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramContactsView_PreviewContainer()
    }
}

struct TelegramContactsView_PreviewContainer: View {
    
    @State var newContact = false
    var body: some View {
        NavigationView {
            TelegramContactsView(newContact: $newContact)
        }
    }
}
