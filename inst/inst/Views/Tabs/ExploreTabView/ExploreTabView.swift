//
//  ExploreTabView.swift
//  inst
//
//  Created by ilya138 on 24.04.2023.
//

import SwiftUI

struct ExploreTabView: View {
    
    var data: ModelData
    var Columns = Array(repeating: GridItem(spacing: 1), count: 3)
    
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: Columns, spacing: 1) {
                ForEach(0..<16) { _ in
                    Rectangle()
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
    }
}

struct ExploreTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreTabView(data: previewData())
    }
}
