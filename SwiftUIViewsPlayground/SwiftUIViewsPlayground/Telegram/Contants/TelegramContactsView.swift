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
                
            } label: {
                Label("Find People Nearby", systemImage: "mappin.and.ellipse")
                    .foregroundColor(.gray)
            }
            NavigationLink {
                
            } label: {
                Label("Invite Friends", systemImage: "person.badge.plus")
            }
            .foregroundColor(.gray)
            
            ForEach(viewModel.contacts) {contact in
                HStack {
                    TelegramCircleImage(image: contact.img)
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 5)
                    VStack(alignment: .leading) {
                        Text(contact.name)
                        Text("last seen \(contact.lastSeenPresentation)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
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

struct TelegramContactsView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramContactsView_PreviewContainer()
    }
}

struct TelegramContactsView_PreviewContainer: View {
    
    @State var newContact = false
    var body: some View {
        TelegramContactsView(newContact: $newContact)
    }
}
