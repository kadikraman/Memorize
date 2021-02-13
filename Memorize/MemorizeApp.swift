//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kadi Kraman on 07/02/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let themes = [
                Theme(name: "Halloween", emoji: ["🧛‍♀️", "👻", "🎃", "😈", "☠️", "⚰️"], numberOfPairs: 4, color: Color.orange),
                Theme(name: "Fruit", emoji: ["🍏", "🍎", "🍒", "🍍", "🍐"], numberOfPairs: 5, color: Color.green),
                Theme(name: "Emoji", emoji: ["😄", "😂", "🙃", "😍", "😭", "😋", "😓"], numberOfPairs: 6, color: Color.yellow),
                Theme(name: "Flags", emoji: ["🇪🇪", "🇬🇧", "🇺🇸", "🇩🇪", "🇨🇦", "🇫🇮"], numberOfPairs: 5, color: Color.purple),
                Theme(name: "Jobs", emoji: ["👩‍⚕️", "👩‍🎨", "👩‍🎤", "👮‍♀️", "👷‍♀️", "👩‍🌾", "👩‍🏫", "👩‍💻"], numberOfPairs: 7, color: Color.gray),
                Theme(name: "Shoes", emoji: ["🥿", "👠", "👡", "👟", "🥾"], numberOfPairs: 4, color: Color.blue)
            ]
            let game = EmojiMemoryGame(themes: themes)
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
