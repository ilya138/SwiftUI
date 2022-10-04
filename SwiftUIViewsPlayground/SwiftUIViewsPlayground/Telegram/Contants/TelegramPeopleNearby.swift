//
//  TelegramPeopleNearby.swift
//  SwiftUIViewsPlayground
//
//  Created by ilya138 on 9/24/22.
//

import SwiftUI

struct TelegramPeopleNearby: View {
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .frame(width: 150, height: 150)
                .padding(.bottom, 50)
            Text("People Nearby")
                .font(.title)
            Text("Quickly add people nearby who are also viewing this section and discover local groups chats.")
                .padding(.horizontal, 30)
            Text("Please alow on location access to enable this feature.")
                .padding(30)
            Button {
                // pass
            } label: {
                Text("Allow Access").frame(width: 250)
            }
            .buttonStyle(.bordered)
            Spacer()
        }
    }
}

struct TelegramPeopleNearby_Previews: PreviewProvider {
    static var previews: some View {
        TelegramPeopleNearby()
    }
}
