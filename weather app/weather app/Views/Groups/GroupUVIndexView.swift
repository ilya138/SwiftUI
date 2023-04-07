//
//  GroupUVIndexView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupUVIndexView: View {
    var body: some View {
        GroupBox(label: Label("UV INDEX", systemImage: "sun.max.fill").font(.caption)) {
            VStack(alignment: .leading) {
                Text("2").font(.title2)
                Text("Low")
                TempBarView(tempH: 20, tempL: 10)
                Spacer()
                Text("Low for the rest of the day.")
                    .font(.caption)
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupUVIndexView_Previews: PreviewProvider {
    static var previews: some View {
        GroupUVIndexView()
    }
}
