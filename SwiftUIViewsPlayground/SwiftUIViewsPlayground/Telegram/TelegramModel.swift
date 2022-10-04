//
//  TelegramModel.swift
//  SwiftUIViewsPlayground
//
//  Created by Ilya Zakharov on 9/14/22.
//

import Foundation

class CurrentUser {
    var contact: Contact
    var phone: String
    var tag: String
    var image: String = "smiley"
    
    init() {
        let myContact = Contact()
        myContact.name = "Ilya"
        myContact.img = "guitars"
        self.contact = myContact
        self.phone = "+7 777 777 77 77"
        self.tag = "@ilya138"
    }
}

class Message: Identifiable, Equatable {

    var id: String = UUID().uuidString
    var text: String = ""
    var sender: Contact = Contact()
    var date: Date = getRandomDate()
    var mine: Bool {
        sender == viewModel.currentUser.contact
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id
    }
    
    init(text: String, sender: Contact) {
        self.text = text
        self.sender = sender
    }
    
    init() {
        self.text = ""
        self.sender = Contact()
    }
}

class Chat: Identifiable, Equatable {

    var id: String = UUID().uuidString
    var name: String
    
    var messages: [Message] = []
    var unreadCount: Int = 0
    var colors: [Double] = [Double(Int.random(in: 0...1)),
                            Double(Int.random(in: 0...1)),
                            Double(Int.random(in: 0...1))]
    
    var muted: Bool = false
    var archived: Bool = false
    var pinned: Bool = false
    
    var img: String = getRandomImage()
    var owner: Contact? {
        messages.first!.sender
    }
    
    init(name: String) {
        self.name = name
        self.messages = []
    }
    
    func getLastMessage() -> Message {
        if messages.isEmpty {
            return Message()
        } else {
            return messages.last!
        }
    }
    
    func sendMessage(text: String, sender: Contact) {
        let message = Message(text: text, sender: sender)
        message.date = Date()
        self.messages.append(message)
    }
    
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        lhs.id == rhs.id
    }
    
}

class GroupChat: Chat {
    
    var participants: [Contact] = []
    
}

class Contact: Identifiable, Equatable, ObservableObject{
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: String = UUID().uuidString
    var name: String = ""
    var img: String = getRandomImage()
    var lastSeen: Date = Date()
    var colors: [Double] = [Double.random(in: 0...1), Double.random(in: 0...1), Double.random(in: 0...1)]
    
    var lastSeenPresentation: String {
//        if lastSeen.timeIntervalSince(Date.now) < 1000 {
//            return "recently"
//        } else {
            return lastSeen.formatted(.dateTime.day().month())
//        }
    }
    
    var chat: Chat = Chat(name: "")
    
    init() {
        self.name = ""
    }
    
    init(name: String) {
        self.name = name
    }
}

class ViewModel: ObservableObject {
    
    @Published var contacts: [Contact]
    @Published var chats: [Chat]
    @Published var currentUser: CurrentUser
    
    var archivedChats: [Chat] {
        chats.filter { $0.archived }
    }
    
    var nonArchivedChats: [Chat] {
        chats.filter { !$0.archived }
    }
    
    var archivedChatsPresentation: String {
        archivedChats.map{ $0.name }.joined(separator: ", ")
    }
    
    init() {
        self.contacts = [Contact]()
        self.chats = [Chat]()
        self.currentUser = CurrentUser()
        initializeData(viewModel: self)
    }
    
    func sendMessage(chat: Chat, text: String, sender: Contact) {
        chat.sendMessage(text: text, sender: sender)
        objectWillChange.send()
    }
    
    func muteUnmute(chat: Chat) {
        chat.muted = !chat.muted
        objectWillChange.send()
    }
    
    func pinUnpin(chat: Chat) {
        chat.pinned = !chat.pinned
        objectWillChange.send()
    }
    
    func readUnread(chat: Chat) {
        chat.unreadCount = chat.unreadCount == 0 ? chat.messages.count : 0
        objectWillChange.send()
    }
    
    func archiveUnarchive(chat: Chat) {
        chat.archived = !chat.archived
        objectWillChange.send()
    }
    
    func deleteChat(chat: Chat) {
        if let index = viewModel.chats.firstIndex(of: chat) {
            viewModel.chats.remove(at: index)
        }
    }
    
}

var viewModel = ViewModel()

func getRandomImage() -> String {
    return ["paperplane", "paperclip", "ant", "bolt", "hare", "command", "gamecontroller", "gift", "headphones", "lightbulb"].randomElement()!
}

func getRandomName() -> String {
    return ["Vladimir", "Vladislav", "Oliver", "Bogdan", "James", "William", "Miroslav", "Lucas", "Henry",
            "Olivia", "Anna", "Charlotte", "Maria", "Ava", "Evelyn", "Anastasia", "Isabella", "Sophia"].randomElement()!
}

func getRandomDate() -> Date {
    let date = Date()
    let calendar = Calendar.current
    var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    guard
        let days = calendar.range(of: .day, in: .month, for: date),
        let randomDay = days.randomElement()
    else {
            return Date()
    }
    dateComponents.setValue(randomDay, for: .day)
    return calendar.date(from: dateComponents)!
}

func getRandomText() -> String {
    let words = ["a", "about", "all", "also", "and", "as", "at", "be", "because", "but", "by", "can", "come", "could", "day", "do", "even", "find", "first", "for",
             "from", "get", "give", "go","have", "he", "her", "here", "him", "his", "how", "I", "if", "in", "into", "it", "its", "just", "know", "like", "look", "make", "man",
             "many", "me", "more", "my", "new", "no", "not", "now", "of", "on", "one", "only", "or", "other", "our", "out", "people", "say", "see", "she", "so", "some", "take",
             "tell", "than", "that", "the", "their", "them", "then", "there", "these", "they", "thing", "think", "this", "those", "time", "to", "two", "up", "use", "very",
             "want", "way", "we", "well", "what", "when", "which", "who", "will", "with", "would", "year", "you", "your", "😊", "😃", "😚", "😁", "😆", "😩"]
    
    let len = Int.random(in: 0...10)
    var result = ""
    for _ in 0...len {
        result += words.randomElement()! + " "
    }
    
    return result
}

func initializeData(viewModel: ViewModel) {
    
    viewModel.chats = []
    viewModel.contacts = []
    
    // Generate contacts
    for _ in 0...10 {
        var newContact = Contact(name: getRandomName())
        newContact.lastSeen = Date(timeIntervalSinceNow: Double.random(in: -10000000...0))
        viewModel.contacts.append(newContact)
    }
    
    // Generate 1-to-1 chats
    var contactsCopy = viewModel.contacts
    for _ in 0...5 {
        
        var contact = contactsCopy.popLast()!
        let chat = Chat(name: "Chat with \(contact.name)")
        chat.muted = Bool.random()
        chat.archived = Bool.random()
        
        for _ in 0..<Int.random(in: 0...20) {
            let message = Message()
            message.sender = Bool.random() ? contact : viewModel.currentUser.contact
            message.text = getRandomText()
            message.date = getRandomDate()
            chat.messages.append(message)
        }
        if Bool.random() {
            chat.unreadCount = Int.random(in: 0...min(chat.messages.count, 5))
        }
        
        viewModel.chats.append(chat)
        contact.chat = chat
    }
    
    // Generate group chats
    for chatNumber in 0...10 {
        let chat = GroupChat(name: "Group Chat #\(chatNumber)")
        chat.muted = Bool.random()
        chat.archived = Bool.random()
        
        for _ in 0..<Int.random(in: 0...30) {
            let message = Message()
            message.sender = viewModel.contacts.randomElement()!
            message.text = getRandomText()
            message.date = getRandomDate()
            chat.messages.append(message)
        }
        if Bool.random() {
            chat.unreadCount = Int.random(in: 0...min(chat.messages.count, 5))
        }
        
        viewModel.chats.append(chat)
    }
    
    viewModel.contacts.append(viewModel.currentUser.contact)
    
}

