//
//  ProfileTabView.swift
//  inst
//
//  Created by ilya138 on 24.04.2023.
//

import SwiftUI

struct ProfileTabView: View {
    
    var data: ModelData
    var user: User
    
    var body: some View {
        ProfileView(data: data, user: user)
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView(data: previewData(), user: previewData().currentUser)
    }
}
