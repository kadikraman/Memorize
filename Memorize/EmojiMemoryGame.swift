//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kadi Kraman on 08/02/2021.
//
//  View Model
//

import SwiftUI

struct Theme {
    let name: String
    let emoji: [String]
    let numberOfPairs: Int
    let color: Color
}

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String>
    @Published private(set) var theme: Theme
    private var themes: [Theme]
    
    init(themes: [Theme]) {
        self.themes = themes
        let theme = self.themes.randomElement()!
        self.theme = theme
        self.model = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs){ pairIndex in
            theme.emoji[pairIndex]
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
    
    func newGame() {
        let theme = themes.randomElement()!
        self.theme = theme
        model = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs){ pairIndex in
            theme.emoji[pairIndex]
        }
    }
}
