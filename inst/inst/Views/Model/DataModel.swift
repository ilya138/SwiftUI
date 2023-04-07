//
//  DataModel.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    
    var id = UUID()
    
    var sender: User
    var location = ""
    var image = ""
    var description = ""
    var date = ""
    var likes = 0
    var liked = false
    var canComment = Bool.random()
    
    mutating func likeDislike() {
        self.liked = !self.liked
        self.likes += self.liked ? 1 : -1
    }
    
}

struct Story: Identifiable {
    
    var id = UUID()
    
    var image: String
    var date = ""
    var watched = Bool.random()
    
}

struct User: Identifiable {
    
    var id = UUID()
    
    var name: String
    var profilePic: String = ["house", "heart", "paperplane", "snow", "cloud", "wind", "bookmark", "message"].randomElement()!
    var stories = [Story]()
    
    func hasUnwatchedStories() -> Bool {
        self.stories.filter({ $0.watched }).isEmpty
    }
    
}

class ModelData {
    @Published var posts = [Post]()
    @Published var users = [User]()
    @Published var currentUser = User(name: "_ilya138")
    
    init() {
        
        // Create current user
        currentUser.profilePic = "currentUser"
        
        // Stories
        var stories = Array(1...10).map({ "story\($0)" }).shuffled()
        var names = ["kisula22", "ahmet08", "brunetka", "vasya.ivanov", "ludmilasemenovna",
                     "nogotochki_saransk", "penza-travel", "STO.lev.ber", "tattoo.kemer", "qualisto.food22"].shuffled()
        var profilePics = Array(1...10).map({ "user\($0)" }).shuffled()
        
        // Create users
        while !names.isEmpty {
            
            if profilePics.isEmpty {
                break
            }
            
            var newUser = User(name: names.popLast()!)
            newUser.profilePic = profilePics.popLast()!
            
            for _ in 0...Int.random(in: 0...3) {
                if stories.isEmpty {
                    break
                }
                var newStory = Story(image: stories.popLast()!)
                newStory.watched = Bool.random()
                newUser.stories.append(newStory)
            }
            
            users.append(newUser)
        }
        
        // Create posts
        for i in 1...10 {
            var post = Post(sender: users.randomElement()!)
            post.location = ["Moscow", "Penza", "Kemer", "Saranks", ""].randomElement()!
            post.description = getRandomText()
            post.likes = Int.random(in: 0...10000)
            post.image = "photo\(i)"
            post.liked = Bool.random()
            posts.append(post)
        }
        
        posts = posts.shuffled()
    }
    
    func getUserStoriesList() -> [User] {
        var result = self.users.filter({ !$0.stories.isEmpty })
        return result.sorted { $0.hasUnwatchedStories() && !$1.hasUnwatchedStories()}
    }
}


extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var data = ModelData()
    }
}
