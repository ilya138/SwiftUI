//
//  TelegramMainChatRow.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/14/22.
//

import SwiftUI

struct TelegramMainChatRow: View {
    
    @State var chat: Chat
    @ObservedObject var model = viewModel
    
    var body: some View {
        HStack {
            
            var lastMessage = chat.getLastMessage()
            TelegramCircleImage(image: chat.img,
                                colors: chat.colors)
                .frame(width: 55, height: 55)
            VStack(alignment: .leading) {
                HStack {
                    Text(chat.name)
                        .font(.headline)
                        .padding(.bottom, 3)
                    if chat.muted {
                        Image(systemName: "speaker.slash.fill")
                    }
                    Spacer()
                    Text(lastMessage.date, format: .dateTime.day().month())
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(lastMessage.sender.name)
                            .font(.caption)
                        Text(lastMessage.text)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    if chat.unreadCount > 0 {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .overlay {
                                Text(String(chat.unreadCount))
                                    .font(.caption)
                            }
                    }
                }
            }
        }
    }
}

struct TelegramMainChatRow_Previews: PreviewProvider {
    static var previews: some View {
        TelegramMainChatRow(chat: viewModel.chats[0])
    }
}
