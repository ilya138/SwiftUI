//
//  TelegramChatMessagesView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/18/22.
//

import SwiftUI

struct TelegramChatMessagesView: View {
    var chat: Chat
    var message: Message
    
    var body: some View {
        HStack{
            if message.mine {
                Spacer()
            }
            HStack {
                if !message.mine {
                    TelegramCircleImage(image: message.sender.img,
                                        colors: message.sender.colors)
                        .frame(width: 40, height: 40)
                }
                VStack {
                    HStack {
                        if !message.mine || message.sender == chat.owner {
                            Text(message.mine ? "" : message.sender.name)
                                .bold()
                                .foregroundColor(.white.opacity(0.7))
                                .frame(maxWidth: 300, alignment: message.mine ? .trailing : .leading)
                            Text(message.sender == chat.owner ? "owner" : "")
                        }
                    }
                    HStack {
                        Text(message.text)
                            .frame(maxWidth: 300, alignment: message.mine ? .trailing : .leading)
                        Text(message.date, format: .dateTime.hour().minute())
                            .font(.caption2)
                            .fixedSize()
                    }
                }
                .foregroundColor(.gray)
                .frame(maxWidth: 300, alignment: message.mine ? .trailing : .leading)
                .fixedSize()
                .multilineTextAlignment(.center)
                .lineLimit(10)
                .padding(.leading, 10).padding(.trailing, 10).padding(.top, 3).padding(.bottom, 3)
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(maxWidth: 320)
                        .foregroundColor(.gray.opacity(0.2))
                }
                if !message.mine {
                    Spacer()
                }
            }
            
        }
        .padding(.bottom, -4)
        .listRowSeparator(.hidden)
        
    }
}

struct TelegramChatMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        var chat = viewModel.chats[0]
        TelegramChatMessagesView(chat: chat, message: chat.messages[0])
    }
}
