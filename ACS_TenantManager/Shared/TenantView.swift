//
//  TenantView.swift
//  ACS_TenantManager (iOS)
//
//  Created by Admin on 13.09.2022.
//

import SwiftUI

struct TenantView: View {
    var tenant: Tenant
    var body: some View {
        
        VStack() {
            Rectangle()
                .fill(.gray)
                .blur(radius: 5)
                .frame(height: 200)
                .overlay {
                    Circle()
                        .fill(.white)
                        .frame(width: 150, height: 150, alignment: .center)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 7)
                            Text("\(tenant.Tenant)")
                        }
                        .shadow(radius: 7)
                }
            
            
            VStack(alignment: .leading) {
                Text(tenant.Presentation)
                    .font(.title)
                HStack{
                    Text("Created: ")
                        .bold()
                    Text(tenant.Created)
                }
                HStack{
                    Text("Edition: ")
                        .bold()
                    Text(tenant.Edition)
                }
                
            }
            Spacer()
        }
        
    }
}

struct TenantView_Previews: PreviewProvider {
    static var testTenant = Tenant(Tenant: 123, Created: "Today", Edition: "Professional", Presentation: "Test tenant")
    static var previews: some View {
        TenantView(tenant: testTenant)
    }
}
