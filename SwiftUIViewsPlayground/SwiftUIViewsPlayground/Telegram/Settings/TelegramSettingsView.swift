//
//  TelegramSettingsView.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/15/22.
//

import SwiftUI

struct TelegramSettingsView: View {
    var body: some View {
            VStack(alignment: .center, spacing: 0) {
                TelegramCircleImage(image: "smiley.fill")
                    .frame(width: 100, height: 100)
                    .padding(.bottom)
                Text("Your name")
                    .font(.title)
                Text("+7 777 777-77-77 • @test")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                List {
                    Section {
                        NavigationLink {
                            //
                        } label: {
                            Label("Saved Messages", systemImage: "bookmark")
                        }
                        NavigationLink {
                            //
                        } label: {
                            Label("Recent Calls", systemImage: "phone")
                        }
                        NavigationLink {
                            //
                        } label: {
                            Label("Devices", systemImage: "tv")
                        }
                        NavigationLink {
                            //
                        } label: {
                            Label("Chat Folders", systemImage: "folder")
                        }
                    }
                    
                    Section {
                        
                        NavigationLink {
                            //
                        } label: {
                            Label("Notifications and Sounds", systemImage: "bell")
                        }
                        NavigationLink {
                            //
                        } label: {
                            Label("Privacy and Security", systemImage: "lock")
                        }
                        NavigationLink {
                            //
                        } label: {
                            Label("Data and Storage", systemImage: "tray.2.fill")
                        }
                        NavigationLink {
                            //
                        } label: {
                            Label("Appearance", systemImage: "circle.lefthalf.fill")
                        }
                    }
                }
                .listStyle(.insetGrouped)
                Spacer()
            }
            
    }
}

struct TelegramSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramSettingsView()
    }
}
