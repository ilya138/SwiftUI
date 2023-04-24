//
//  ProfileHeaderAddAccountSheet.swift
//  inst
//
//  Created by ilya138 on 24.04.2023.
//

import SwiftUI

struct ProfileSelectionSheet: View {
    
    @State var data: ModelData
    @State var profileSelectionShown: Bool = false
    
    var body: some View {
        
        Group {
            // Current account
            Button {
                profileSelectionShown.toggle()
            } label: {
                HStack {
                    ProfileCircle(size: 70, user: data.currentUser)
                    Text("**\(data.currentUser.login)**")
                        .font(.headline)
                        .padding(.horizontal)
                        .tint(.primary)
                    
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .tint(.blue)
                    
                }
            }
            
            Divider()
            
            // Add account
            Button {
                
            } label: {
                HStack {
                    Circle()
                        .stroke(lineWidth: 1)
                        .fill(.gray.opacity(0.5))
                    
                        .frame(width: 70, height: 70)
                        .overlay {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(.primary)
                            
                            
                        }
                    Text("Add account")
                        .font(.headline)
                        .padding(.horizontal)
                        .tint(.primary)
                    Spacer()
                }
            }
        }
        .presentationDetents([.height(200)])
        .padding(.horizontal)
    }
}


struct ProfileSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectionSheet(data: previewData())
    }
}
