//
//  GroupPrecipitationView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupPrecipitationView: View {
    var body: some View {
        GroupBox(label: Label("PRECIPITATION", systemImage: "drop.fill").font(.caption)) {
            VStack(alignment: .leading) {
                Text("0 mm").font(.title2)
                Text("in last 24h")
                Spacer()
                Text("Wind is making it feel cooler.")
                    .font(.caption)
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupPrecipitationView_Previews: PreviewProvider {
    static var previews: some View {
        GroupPrecipitationView()
    }
}
