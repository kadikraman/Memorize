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

let themes = [
    Theme(name: "Halloween", emoji: ["🧛‍♀️", "👻", "🎃", "😈", "☠️", "⚰️"], numberOfPairs: 4, color: Color.orange),
    Theme(name: "Fruit", emoji: ["🍏", "🍎", "🍒", "🍍", "🍐"], numberOfPairs: 5, color: Color.green),
    Theme(name: "Emoji", emoji: ["😄", "😂", "🙃", "😍", "😭", "😋", "😓"], numberOfPairs: 6, color: Color.yellow),
    Theme(name: "Flags", emoji: ["🇪🇪", "🇬🇧", "🇺🇸", "🇩🇪", "🇨🇦", "🇫🇮"], numberOfPairs: 5, color: Color.purple),
    Theme(name: "Jobs", emoji: ["👩‍⚕️", "👩‍🎨", "👩‍🎤", "👮‍♀️", "👷‍♀️", "👩‍🌾", "👩‍🏫", "👩‍💻"], numberOfPairs: 7, color: Color.gray),
    Theme(name: "Shoes", emoji: ["🥿", "👠", "👡", "👟", "🥾"], numberOfPairs: 4, color: Color.blue)
]

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String, Theme> = createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String, Theme> {
        let theme = themes.randomElement()!
        return MemoryGame<String, Theme>(numberOfPairsOfCards: theme.numberOfPairs, theme: theme){ pairIndex in
            theme.emoji[pairIndex]
        }
    }
    
    // MARK: Access to the model
    var cards: Array<MemoryGame<String, Theme>.Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    func choose(card: MemoryGame<String, Theme>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func newGame() {
        let theme = themes.randomElement()!
        model = MemoryGame<String, Theme>(numberOfPairsOfCards: theme.numberOfPairs, theme: theme){ pairIndex in
            theme.emoji[pairIndex]
        }
    }
}
