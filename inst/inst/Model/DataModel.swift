//
//  DataModel.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import Foundation
import SwiftUI
import AVFoundation

struct Post: Identifiable {
    
    var id = UUID()
    
    var sender: User
    var location = ""
    var images = [String]()
    var description = ""
    var date = ""
    
    // Likes
    var likes = 0
    var liked = false
    
    // Comments
    var canComment = Bool.random()
    var comments = [String]()
    
    // Views
    var views = Int.random(in: 0...1000)
    
    // Shares
    var shares = Int.random(in: 0...20)
    
    func getImage() -> String {
        self.images.first ?? ""
    }
    
    mutating func likeDislike() {
        self.liked = !self.liked
        self.likes += self.liked ? 1 : -1
    }
    
    func getThumbnail() -> UIImage? {
        do {
            let asset = AVURLAsset(url: Bundle.main.url(forResource: getImage(), withExtension: "mp4")!, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
}

struct Story: Identifiable {
    
    var id = UUID()
    
    var image: String
    var date = ""
    var watched = Bool.random()
    var liked = false
    
    mutating func likeDislike() {
        self.liked = !self.liked
    }
    
}

struct StoryGroup: Identifiable {
    
    var id = UUID()
    
    var name = ""
    var image = ""
    var stories = [Story]()
}

struct User: Identifiable, Hashable, Equatable {
    
    var id = UUID()
    
    var name: String
    var login = ""
    var profilePic: String = ["house", "heart", "paperplane", "snow", "cloud", "wind", "bookmark", "message"].randomElement()!
    var description: String = ""
    
    // Stories
    var stories = [Story]()
    var storyGroups = [StoryGroup]()
    
    // Posts
    var posts = [Post]()
    
    // Reels
    var reels = [Post]()
    
    // Tags
    var tags = [Post]()
    
    // Followers
    var followers = Int.random(in: 1...1000)
    
    // Following
    var following = Int.random(in: 1...1000)
    
    func hasUnwatchedStories() -> Bool {
        self.stories.filter({ $0.watched }).isEmpty
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

class ModelData {
    @Published var posts = [Post]()
    @Published var users = [User]()
    @Published var currentUser = User(name: "Ilya Zakharov")
    
    init() {
        
        // Create current user
        currentUser.login = "_ilya138"
        currentUser.profilePic = "currentUser"
        currentUser.description = "hey, it's me, Ilya 😋"
        
        // Current user stories
        var currentUserStories = Array(0...6).map( { "currentUserStory\($0)" })
        
        // Story groups
        for _ in 1...3 {
            var storyGroup = StoryGroup()
            
            // Stories
            for _ in 1...2 {
                var newStory = Story(image: currentUserStories.popLast()!)
                newStory.watched = Bool.random()
                storyGroup.stories.append(newStory)
                currentUser.stories.append(newStory)
            }
            
            storyGroup.image = storyGroup.stories.randomElement()!.image
            storyGroup.name = getRandomText(len: 2)
            currentUser.storyGroups.append(storyGroup)
        }
        
        // Current user posts
        for i in 1...8 {
            var post = Post(sender: currentUser)
            post.location = ["Moscow", "Penza", "Kemer", "Saranks", ""].randomElement()!
            post.description = getRandomText()
            post.likes = Int.random(in: 0...10000)
            post.images.append("currentUserPhoto\(i)")
            
            // multi-image post
            if Bool.random() {
                post.images.append("currentUserPhoto\(Int.random(in: 1...8))")
            }
            post.liked = Bool.random()
            currentUser.posts.append(post)
        }
        
        // Current user reels
        for i in 1...4 {
            var reel = Post(sender: currentUser)
            reel.location = ["Moscow", "Penza", "Kemer", "Saranks", ""].randomElement()!
            reel.description = getRandomText()
            reel.likes = Int.random(in: 0...10000)
            reel.images.append("currentUserReel\(i)")
            reel.liked = Bool.random()
            currentUser.reels.append(reel)
        }
        
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
            post.images.append("photo\(i)")
            if Bool.random() {
                post.images.append("photo\(Int.random(in: 1...10))")
            }
            post.liked = Bool.random()
            posts.append(post)
            
            // Tag current user
            if Int.random(in: 0...10) > 8 {
                //currentUser.tags.append(post)
            }
        }
        
        posts = posts.shuffled()
    }
    
    func getUserStoriesList() -> [User] {
        let result = self.users.filter({ !$0.stories.isEmpty })
        return result.sorted { $0.hasUnwatchedStories() && !$1.hasUnwatchedStories()}
    }
}


extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var data = ModelData()
    }
}

extension PreviewProvider {
    static func previewData() -> ModelData {
        ContentView.ViewModel().data
    }
}
