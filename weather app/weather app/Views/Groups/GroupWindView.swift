//
//  GroupWindView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct GroupWindView: View {
    var body: some View {
        GroupBox(label: Label("WIND", systemImage: "wind").font(.caption)) {
            Text("WIP")
            Spacer()
        }
        .groupBoxStyle(CustomGroupBoxStyle())
    }
}

struct GroupWindView_Previews: PreviewProvider {
    static var previews: some View {
        GroupWindView()
    }
}
