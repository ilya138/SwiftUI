//
//  ProfileAddActions.swift
//  inst
//
//  Created by ilya138 on 24.04.2023.
//

import SwiftUI

struct AddActionsSheet: View {

    let buttons = [("Reel", "video"),
                   ("Post", "grid"),
                   ("Story", "plus"),
                   ("Story highlight", "heart"),
                   ("Live", "cross"),
                   ("Guide", "cross")]
    
    var body: some View {
        
        Text("Create")
        VStack(alignment: .leading) {
            ForEach(buttons, id: \.0) { title, image in
                Divider()
                Button {} label: {Label(title, systemImage: image)}
                
            }
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
        .font(.title3)
        .padding()
        .padding(.vertical, 15)
        
    }
}

struct AddActionsSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddActionsSheet()
    }
}
