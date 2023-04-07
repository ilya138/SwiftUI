//
//  ContentView.swift
//  weather app
//
//  Created by Admin on 02.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTab = 0
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
            TabView(selection: $currentTab, content:  {
                ForEach(viewModel.locations) {location in
                    LocationView(location: location)
                        .tag(location.id)
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .always))
            .edgesIgnoringSafeArea(.all)
//            .toolbar{
//                ToolbarItem(placement: .bottomBar) {
//                    Text("test")
//                }
//            }

    }
}

struct CustomGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        VStack(alignment: .leading) {
            configuration.label
                .foregroundColor(.white)
                .font(.caption)
                .opacity(0.4)
            configuration.content
                .opacity(1)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding()
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
