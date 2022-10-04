//
//  TelegramNewContactView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/20/22.
//

import SwiftUI

struct TelegramNewContactView: View {
    
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
