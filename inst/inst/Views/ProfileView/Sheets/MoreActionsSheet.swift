//
//  ProfileMoreActionsView.swift
//  inst
//
//  Created by ilya138 on 24.04.2023.
//

import SwiftUI

struct MoreActionsSheet: View {
    
    let buttons = [("Settings", "gear"),
                   ("Scheduled content", "clock"),
                   ("Your activity", "clock"),
                   ("Archive", "cross"),
                   ("Insights", "cross"),
                   ("QR code", "cross"),
                   ("Saved", "cross"),
                   ("Orders and payments", "cross"),
                   ("Close friends", "cross"),
                   ("Favourites", "star"),
                   ("Discover people", "person")]
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            ForEach(buttons, id: \.0) { title, image in
                Button {} label: {Label(title, systemImage: image)}
                Divider()
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
        .font(.title3)
        .padding()
        .padding(.vertical, 15)
        
        
    }
}

struct MoreActionsSheetPreviews: PreviewProvider {
    static var previews: some View {
        MoreActionsSheet()
    }
}
