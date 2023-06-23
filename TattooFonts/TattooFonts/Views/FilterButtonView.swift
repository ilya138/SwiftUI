//
//  FilterButtonView.swift
//  TattooFonts
//
//  Created by ilya138 on 03.05.2023.
//

import SwiftUI

struct FilterButtonView: View {
    
    @Binding var likedOnly: Bool
    
    var body: some View {
        // Filter
        Button {
            withAnimation {
                likedOnly.toggle()
            }
        } label: {
            Circle()
                .foregroundColor(.white)
                .shadow(radius: 10)
                .blur(radius: 1)
                .frame(width: 70)
                .overlay {
                    Image(systemName: likedOnly ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                    
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
        }
        .contextMenu {
            Button {
                UserDefaults.standard.removeObject(forKey: "likes")
            } label: {
                Label("Reset settings", systemImage: "gear")
            }
        }
    }
}

struct PreviewParent: View {
    
    @State var likedOnly: Bool = false
    
    var body: some View {
        FilterButtonView(likedOnly: $likedOnly)
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewParent()
    }
}
