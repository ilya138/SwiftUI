//
//  GroupSunsetView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupSunsetView: View {
    var body: some View {
        GroupBox(label: Label("SUNSET", systemImage: "sunset").font(.caption)) {
            VStack(alignment: .leading) {
                Text("19:08").font(.title2)
                Spacer()
                Text("Sunrise: 05:56")
                    .font(.caption)
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupSunsetView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSunsetView()
    }
}
