//
//  UserFeedbackView.swift
//  FisioDance
//
//  Created by mcor on 05/04/23.
//

import SwiftUI

enum EmojiToInt: Int, CaseIterable {
    case impossible = 1
    case hard = 2
    case neutral = 3
    case fine = 4
    case easy = 5
    
    var emoji: String {
        switch self {
        case .impossible:
            return "😭"
        case .hard:
            return "🥵"
        case .neutral:
            return "😐"
        case .fine:
            return "🙂"
        case .easy:
            return "😍"
        }
    }
    
    
}

class Feedback {
   // var emojiToInt = EmojiToInt()
    var exerciseToEmoji: [String: String] = ["Vamos Aquecer": "",
                                             "Alongamento simples": ""]
}

class FeedbackManager {
    static let shared = FeedbackManager()
    
    var emojiToInt: EmojiToInt? {
        let defaults = UserDefaults.standard
        let emojiToIntValue = defaults.integer(forKey: "emojiToInt")
        return EmojiToInt(rawValue: emojiToIntValue)
    }
    
    var feedbackRepresentable: Feedback? {
        let defaults = UserDefaults.standard
        let feedbackDictionary = defaults.dictionary(forKey: "feedbackRepresentable")
        return Feedback()
    }
}

struct UserFeedbackView: View {
    @State private var selectedEmoji = EmojiToInt.neutral
    @State private var selectedExercise = "Vamos Aquecer"
    
    var body: some View {
        VStack {
//            Text("Qual foi seu nível de dificuldade em realizar este exercício?")
//                //.font(.title2)
//                .font(.custom("Jura", size: 24))
//                .foregroundColor(Color("dark-blue90"))
            
            HStack {
                ForEach(EmojiToInt.allCases, id: \.self) { emojiToInt in
                    Button(action: {
                        self.selectedEmoji = emojiToInt
                        saveFeedback()
                    }) {
                        Text(emojiToInt.emoji)
                            .font(.largeTitle)
                    }
                    .buttonStyle(FeedbackButtonStyle(selectedEmoji: self.selectedEmoji, emoji: emojiToInt))
                }
            }
            
        }
    }
    
    
    func saveFeedback() {
        let defaults = UserDefaults.standard
        defaults.set(selectedEmoji.rawValue, forKey: "emojiToInt")
        defaults.set(selectedExercise, forKey: "feedbackRepresentable")
    }
}

struct FeedbackButtonStyle: ButtonStyle {
    let selectedEmoji: EmojiToInt
    let emoji: EmojiToInt
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(selectedEmoji == emoji ? Color("dark-blue90") : Color("light-blue30"))
            .cornerRadius(10)
    }
}

struct UserFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        UserFeedbackView()
    }
}
