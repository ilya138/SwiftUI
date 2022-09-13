//
//  BasesView.swift
//  ACS_TenantManager (iOS)
//
//  Created by Admin on 13.09.2022.
//

import SwiftUI

struct BasesView: View {
    
    var bases = ["INV2", "INV3", "INV4","TeamA_Accounting", "TeamC_Reports", "TeamC_PrintForms", "TeamC_UIUX"]
    var body: some View {
        NavigationView {
            List(bases, id: \.self) {item in
                NavigationLink {
                    TenantsView(database: item.self)
                } label: {
                    Text(item)
                }
                
            }
            .navigationTitle("Bases")
            Spacer()
            
        }
    }
}

struct BasesView_Previews: PreviewProvider {
    static var previews: some View {
        BasesView()
    }
}
