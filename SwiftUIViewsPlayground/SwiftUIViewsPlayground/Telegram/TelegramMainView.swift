//
//  TelegramMainView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/14/22.
//

import SwiftUI

enum Page {
    case contacts
    case chats
}

struct TelegramMainView: View {
    
    @State private var currentTab: TelegramTabs = .chats
    @State var newContact = false
    @State var newChat = false
    @State var contactsSort = ContactsSort.byLastSeen
    @State var searchText = ""
    @State var refreshContacts = false
    @StateObject var model = viewModel
    
    enum TelegramTabs {
        case contacts
        case chats
        case settings
    }
    
    enum ContactsSort {
        case byLastSeen
        case byName
    }
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $currentTab) {
                TelegramContactsView(newContact: $newContact)
                    .tabItem {
                        Label("Contacts", systemImage: "person.circle.fill")
                    }
                
                    .tag(TelegramTabs.contacts)
                TelegramChatsView(newChat: $newChat)
                    .tabItem {
                        Label("Chats", systemImage: "message.fill")
                    }
                    .tag(TelegramTabs.chats)
                TelegramSettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "pencil.circle")
                    }
                    .tag(TelegramTabs.settings)
            }
            
            .onAppear {
                let mainColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
                UITabBar.appearance().backgroundColor = mainColor
            }
            .toolbar {
                // top
                ToolbarItem(placement: .navigationBarLeading) {
                    if currentTab == .contacts {
                        Menu {
                            Picker("Sort by:", selection: $contactsSort) {
                                Text("by Last Seen").tag(ContactsSort.byLastSeen)
                                Text("by Name").tag(ContactsSort.byName)
                            }
                            .onChange(of: contactsSort) { value in
                                if contactsSort == .byName {
                                    viewModel.contacts = viewModel.contacts.sorted {
                                        $0.name < $1.name
                                    }
                                } else if contactsSort == .byLastSeen {
                                    viewModel.contacts = viewModel.contacts.sorted {
                                        $0.lastSeen < $1.lastSeen
                                    }
                                }
                            }
                        } label: {
                            Text("Sort")
                        }
                    } else if currentTab == .chats {
                        EditButton()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(currentTab == .contacts ? "Contacts" :
                         currentTab == .chats ? "Chats" : "")
                        .fixedSize()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if currentTab == .chats {
                            newChat = true
                        } else {
                            newContact = true
                        }
                    } label: {
                        Image(systemName: currentTab == .contacts ? "plus" : "square.and.pencil")
                            .foregroundColor(.gray)
                    }
                }
            }
            .accentColor(.gray)
            .navigationBarHidden(currentTab == .settings)
            
        }
        .searchable(text: $searchText) {
            // pass
        }
        .tint(.gray)
        .accentColor(.gray)
    }
    
}

struct TelegramMainView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramMainView()
    }
}

