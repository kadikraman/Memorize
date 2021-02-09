//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kadi Kraman on 08/02/2021.
//
//  View Model
//

import SwiftUI

func createCardContent(pairIndex: Int) -> String {
    return "😄"
}

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "🧛‍♀️", "😈", "💚", "🌶", "🌼", "🏆", "💥", "🇪🇪", "🥳"].shuffled()
        let numberOfPairs: Int = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
