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
        //TabView {
            MainView(data: model.data)
                .padding(.top, 1)
//                .tabItem {
//                    Image(systemName: "house")
//                }
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                }
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "plus.square.fill")
//                }
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "play.display")
//                }
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "circle")
//                }
//       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
