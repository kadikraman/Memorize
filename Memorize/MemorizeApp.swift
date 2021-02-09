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
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
