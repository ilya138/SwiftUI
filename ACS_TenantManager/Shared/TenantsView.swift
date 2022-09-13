//
//  TenantsView.swift
//  ACS_TenantManager (iOS)
//
//  Created by Admin on 13.09.2022.
//

import SwiftUI

struct TenantsView: View {
    
    var database: String = ""
    @State private var tenants = [Tenant]()
    var URL: String {
        "https://pre-dev.accountingsuite.com/a/\(database)_admin/hs/TM/GetTenants"}
    
    var body: some View {
        List(tenants, id: \.Tenant) {item in
            NavigationLink {
                TenantView(tenant: item)
            } label: {
                Text("\(item.Tenant)")
                    .font(.headline)
            }
        }
        .navigationTitle("\(database)")
        .task {
            do {
                if let result = try await loadTenants(BaseURL: URL) {
                    tenants = result
                }
            } catch {
                print("Error", error)
            }
        }
        Spacer()
    }
}

struct TenantsView_Previews: PreviewProvider {
    static var previews: some View {
        TenantsView()
    }
}
