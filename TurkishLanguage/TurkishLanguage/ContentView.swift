//
//  ContentView.swift
//  TurkishLanguage
//
//  Created by ilya138 on 03.11.2022.
//

import SwiftUI
import AVFoundation

var difficulties = [9, 99, 999, 9999]

enum Modes: String {
    case numberFirst = "Numbers"
    case wordsFirst = "Words"
}

struct ContentView: View {
    
    @State var theNumber = Int.random(in: 0...difficulties[0])
    @State var theNumberSpelled = ""
    @State var showAnswer = false
    @State var selectedDifficulty = difficulties[0]
    @State var mode: Modes = .numberFirst
    @State var top = ""
    @State var bottom = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                Text(mode == .numberFirst ? String(theNumber) : theNumberSpelled)
                    .font(.system(size: 50))
                    .onTapGesture {
                        showAnswer.toggle()
                        if showAnswer {
                            pronounceNumber()
                        } else {
                            generateShowNumber()
                        }
                    }
                if showAnswer {
                    Text(mode == .numberFirst ? theNumberSpelled : String(theNumber))
                        .font(.system(size: 20))
                }

                Spacer()
                Button("Pronounce 🗣") {
                    pronounceNumber()
                }
            }
            .onAppear() {
                generateShowNumber()
            }
            .onChange(of: selectedDifficulty) {tag in
                generateShowNumber()
                showAnswer = false
            }
            .onChange(of: mode) {tag in
                generateShowNumber()
                if mode == .wordsFirst {
                    pronounceNumber()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Picker("Difficulty", selection: $selectedDifficulty) {
                        ForEach(difficulties, id: \.self) {value in
                            Text("Difficulty: up to " + String(value))
                                .tag(value)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Picker("Mode", selection: $mode) {
                        Text(Modes.numberFirst.rawValue)
                            .tag(Modes.numberFirst)
                        Text(Modes.wordsFirst.rawValue)
                            .tag(Modes.wordsFirst)
                    }
                }
            }
        }
    }
    func generateShowNumber() {
        // Generate a number and spell it
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = Locale(identifier: "tr_TR")

        theNumber = Int.random(in: 0..<selectedDifficulty)
        theNumberSpelled = formatter.string(from: theNumber as NSNumber)!
    }
    
    func pronounceNumber() {
        // Pronounce it
        let utterance = AVSpeechUtterance(string: theNumberSpelled)
        utterance.voice = AVSpeechSynthesisVoice(language: "tr-TR")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
