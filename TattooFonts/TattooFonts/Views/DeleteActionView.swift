//
//  DeleteActionView.swift
//  TattooFonts
//
//  Created by ilya138 on 03.05.2023.
//

import SwiftUI

struct DeleteActionView: View {
    
    var model: ViewModel
    var font: FontItem
    
    var body: some View {
        Button(role: .destructive) {
            withAnimation {
                //model.likeFont(font: font)
            }
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
}
