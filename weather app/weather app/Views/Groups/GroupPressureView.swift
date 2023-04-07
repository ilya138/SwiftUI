//
//  GroupPressureView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupPressureView: View {
    var body: some View {
        GroupBox(label: Label("PRESSURE", systemImage: "umbrella").font(.caption)) {
            Text("WIP")
            Spacer()
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupPressureView_Previews: PreviewProvider {
    static var previews: some View {
        GroupPressureView()
    }
}
