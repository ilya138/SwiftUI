//
//  ModelMockup.swift
//  inst
//
//  Created by Admin on 04.04.2023.
//

import Foundation

func getRandomText(len: Int = 20) -> String {
    let words = ["a", "about", "all", "also", "and", "as", "at", "be", "because", "but", "by", "can", "come", "could", "day", "do", "even", "find", "first", "for",
             "from", "get", "give", "go","have", "he", "her", "here", "him", "his", "how", "I", "if", "in", "into", "it", "its", "just", "know", "like", "look", "make", "man",
             "many", "me", "more", "my", "new", "no", "not", "now", "of", "on", "one", "only", "or", "other", "our", "out", "people", "say", "see", "she", "so", "some", "take",
             "tell", "than", "that", "the", "their", "them", "then", "there", "these", "they", "thing", "think", "this", "those", "time", "to", "two", "up", "use", "very",
             "want", "way", "we", "well", "what", "when", "which", "who", "will", "with", "would", "year", "you", "your", "😊", "😃", "😚", "😁", "😆", "😩"]
    
    let len = Int.random(in: 0...len)
    var result = ""
    for _ in 0...len {
        result += words.randomElement()! + " "
    }
    
    return result
}

