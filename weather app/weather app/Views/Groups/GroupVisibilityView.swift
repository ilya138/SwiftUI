//
//  GroupVisibilityView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupVisibilityView: View {
    var body: some View {
        GroupBox(label: Label("VISIBILITY", systemImage: "eye").font(.caption)) {
            VStack(alignment: .leading) {
                Text("14 km").font(.title2)
                Spacer()
                Text("It's lear right now.")
                    .font(.caption)
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupVisibilityView_Previews: PreviewProvider {
    static var previews: some View {
        GroupVisibilityView()
    }
}
