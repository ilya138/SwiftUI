//
//  GroupHumidityView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupHumidityView: View {
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("76 %").font(.title2)
                Spacer()
                Text("The dew point is 12° right now.")
                    .font(.caption)
            }
        } label: {
            Label("HUMIDITY", systemImage: "humidity.fill").font(.caption)
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupHumidityView_Previews: PreviewProvider {
    static var previews: some View {
        GroupHumidityView()
    }
}
