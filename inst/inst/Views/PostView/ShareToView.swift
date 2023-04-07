//
//  ShareToView.swift
//  inst
//
//  Created by Admin on 05.04.2023.
//

import SwiftUI

struct ShareToView: View {
    
    var data: ModelData
    
    var body: some View {
        
        HStack {
            Spacer()
                .frame(width: 5)
            ForEach(0..<4) { index in
                ProfileCircle(size: 40, user: data.users[index])
            }
            .padding(.vertical, 5)
            Spacer()
                .frame(width: 5)
        }
        .background(Color.black.opacity(0.8))
        .cornerRadius(20)
        Spacer()
        
    }
    
}

struct ShareToView_Previews: PreviewProvider {
    static var previews: some View {
        ShareToView(data: ContentView.ViewModel().data)
    }
}
