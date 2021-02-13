//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Kadi Kraman on 07/02/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Group {
            Text(viewModel.theme.name).font(.largeTitle).bold().padding(.top, 20)
            Text("Score: \(viewModel.model.score)").bold()
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture() {
                    viewModel.choose(card: card)
                }.padding(cardPadding)
            }
            .foregroundColor(viewModel.theme.color)
            Button("New Game"){
                viewModel.newGame()
            }.padding(.bottom, 20)
        }
    }
    
    // MARK: Drawing Constants
    
    let cardPadding: CGFloat = 5
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader() { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let cardRatio: CGFloat = 2/3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let themes = [Theme(name: "Fruit", emoji: ["🍏", "🍎", "🍒", "🍍", "🍐"], numberOfPairs: 5, color: Color.green)]
        let game = EmojiMemoryGame(themes: themes)
        EmojiMemoryGameView(viewModel: game)
    }
}
