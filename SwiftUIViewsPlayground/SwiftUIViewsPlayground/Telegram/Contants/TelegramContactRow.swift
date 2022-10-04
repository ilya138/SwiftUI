//
//  TelegramContactRow.swift
//  SwiftUIViewsPlayground
//
//  Created by ilya138 on 9/27/22.
//

import SwiftUI

struct TelegramContactRow: View {
    
    @State var contact: Contact
    
    var body: some View {
        HStack {
            TelegramCircleImage(image: contact.img, colors: contact.colors)
                .frame(width: 30, height: 30)
                .padding(.trailing, 5)
            VStack(alignment: .leading) {
                Text(contact.name)
                Text("last seen \(contact.lastSeenPresentation)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct TelegramContactRow_Previews: PreviewProvider {
    static var previews: some View {
        TelegramContactRow(contact: viewModel.contacts[0])
    }
}
