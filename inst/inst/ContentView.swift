//
//  ContentView.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        TabView {
            
            FeedTabView(data: model.data)
                .padding(.top, 1)
                .tabItem {
                    Image(systemName: "house")
                }
            ExploreTabView(data: model.data)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            ExploreTabView(data: model.data)
                .tabItem {
                    Image(systemName: "plus.square.fill")
                }
            ExploreTabView(data: model.data)
                .tabItem {
                    Image(systemName: "play.display")
                }
            ProfileTabView(data: model.data, user: model.data.currentUser)
                .tabItem {
                    Image(systemName: "circle")
                }
//            DebugTabView(data: model.data)
//                .tabItem {
//                    Image(systemName: "power")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
