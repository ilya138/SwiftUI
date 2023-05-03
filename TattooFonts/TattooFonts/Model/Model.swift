//
//  Model.swift
//  TattooFonts
//
//  Created by ilya138 on 03.05.2023.
//

import Foundation
import SwiftUI

struct FontItem: Codable {
    
    var name: String
    var liked = false
    
    mutating func like() -> Bool {
        self.liked = !self.liked
        return self.liked
    }
}

class ViewModel: ObservableObject {
    
    @Published var fonts = [FontItem]()
    var likes = [String: Bool]()
    
    func likeFont(font: FontItem) {
        
        likes[font.name] = fonts[fonts.firstIndex(where: {$0.name == font.name})!].like()
        
        // Save likes
        UserDefaults.standard.set(likes, forKey: "likes")
    }
    
    // Get fonts (all or liked only)
    func getFonts(_ likedOnly: Bool) -> [FontItem] {
        return fonts.filter ( {likedOnly ? $0.liked : true })
    }
    
    init() {
        
        let allFontNames = UIFont.familyNames
            .flatMap { UIFont.fontNames(forFamilyName: $0) }
        
        for item in allFontNames {
            fonts.append(FontItem(name: item))
        }
        
        // restore likes
        var storedLikes = UserDefaults.standard.object(forKey: "likes") as? [String: Bool] ?? [:]

        for like in storedLikes {
            fonts[fonts.firstIndex(where: {$0.name == like.key})!].liked = like.value
        }
    }
    
}


