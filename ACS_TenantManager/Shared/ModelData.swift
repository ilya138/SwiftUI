//
//  ModelData.swift
//  ACS_TenantManager (iOS)
//
//  Created by Admin on 12.09.2022.
//

import Foundation

struct Response: Codable {
    var results: [Tenant]
}

struct Tenant: Codable {
    var Tenant: Int
    var Created: String
    var Edition: String
    var Presentation: String
}

func loadTenants(BaseURL: String) async throws -> [Tenant]? {
    
    var tenantData: [[String: Any]] = []
    
    URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
    
    let url = URL(string: BaseURL)!
    var request = URLRequest(url: url)
    request.setValue("Basic VGVhbUFfVGVuYW50TWFuYWdlcjpkZW1v", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    
    let (data, response) = try await URLSession.shared.data(for: request)

    // check the status code
    guard let httpResponse = response as? HTTPURLResponse else {
        print("Error: It's not a HTTP URL response")
        return nil
    }
    
    // parse the result as JSON, since that's what the API provides
    do {
        let decoded = try JSONDecoder().decode([Tenant].self, from: data)
        return decoded
    
    } catch  {
        print("error trying to convert data to JSON:", error)
        return nil
    }
    
    return nil
    
}


