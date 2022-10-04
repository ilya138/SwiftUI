//
//  TelegramChatView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/14/22.
//

import SwiftUI

struct TelegramChatView: View {
    
    @State var chat: Chat
    @State var textMessage: String = ""
    @FocusState var messageFocus: Bool
    @FocusState var chatFocus: Bool
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(chat.messages) { message in
                        TelegramChatMessagesView(chat: chat, message: message)
                            .padding(.bottom, messageFocus && message.id == chat.messages.last!.id ? 10 : 0)
                            .id(message.id)
                    }
                    .focused($chatFocus)
                    .listStyle(.plain)
                    .onAppear {
                        proxy.scrollTo(chat.messages.last?.id)
                    }
                    .onChange(of: self.chat.messages.count, perform: { count in
                        proxy.scrollTo(chat.messages.last?.id)
                    })
                    .onTapGesture {
                        messageFocus = false
                    }
                }
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    // Chat title
                    ToolbarItemGroup(placement: .principal) {
                        VStack {
                            Text(chat.name)
                            Text("last seen recently")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .fixedSize()
                            
                        }
                    }
                    // Chat image
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Circle()
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image(systemName: chat.img)
                                    .foregroundColor(.black)
                            }
                    }
                    
                    // Bottom
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack {
                            Button {
                                print("Open smiles")
                            } label: {
                                Image(systemName: "paperclip")
                            }
                            
                            HStack {
                                TextField("Message", text: $textMessage)
                                    .focused($messageFocus)
                                    .padding(.leading)
                                    .toolbar {
                                        ToolbarItemGroup(placement: .keyboard) {
                                            HStack {
                                                Image(systemName: "paperclip")
                                                
                                                HStack {
                                                    TextField("Message", text: $textMessage)
                                                        .padding(.leading)
                                                    Image(systemName: "heart.circle")
                                                        .padding(.trailing, 4)
                                                }
                                                .background(RoundedRectangle(cornerRadius: 20)
                                                    .strokeBorder(.gray, lineWidth: 1)
                                                    .frame(height: 35))
                                                
                                                HStack {
                                                    if textMessage.isEmpty {
                                                        Button {
                                                            print("mic")
                                                        } label: {
                                                            Image(systemName: "mic")
                                                                .fixedSize()
                                                            
                                                        }
                                                    } else {
                                                        Button {
                                                            chat.sendMessage(text: textMessage, sender: viewModel.currentUser.contact)
                                                            textMessage = ""
                                                        } label: {
                                                            Image(systemName: "arrow.up.circle.fill")
                                                                .fixedSize()
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                
                                Button {
                                    print("Open smiles")
                                } label: {
                                    Image(systemName: "smiley")
                                }
                            }
                            .background(RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(.gray, lineWidth: 1)
                                .frame(height: 35))
                            
                            HStack {
                                if textMessage.isEmpty {
                                    Button {
                                        print("recording")
                                    } label: {
                                        Image(systemName: "mic")
                                            .fixedSize()
                                        
                                    }
                                } else {
                                    Button {
                                        chat.sendMessage(text: textMessage, sender: viewModel.currentUser.contact)
                                        textMessage = ""
                                    } label: {
                                        Image(systemName: "arrow.up.circle.fill")
                                            .fixedSize()
                                    }
                                }
                            }
                        }
                        .foregroundColor(.gray)
                    }
                }
                
            }
            
        }
    }

}


struct TelegramChatView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            TelegramChatView(chat: viewModel.chats[0])
        }
        
    }
}


