//
//  GroupFeelsLikeView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupFeelsLikeView: View {
    var body: some View {
        GroupBox(label: Label("FEELS LIKE", systemImage: "thermometer.medium").font(.caption)) {
            VStack(alignment: .leading) {
                Text("16°").font(.title2)
                Spacer()
                Text("Wind is making it feel cooler.")
                    .font(.caption)
            }
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupFeelsLikeView_Previews: PreviewProvider {
    static var previews: some View {
        GroupFeelsLikeView()
    }
}
