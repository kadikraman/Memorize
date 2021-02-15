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
    
    @ViewBuilder
    var body: some View {
        GeometryReader() { geometry in
            if (card.isFaceUp || !card.isMatched) {
                ZStack {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    Text(card.content)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .font(Font.system(size: fontSize(for: geometry.size)))
            }
        }
    }
    
    // MARK: Drawing Constants
    
    private let cardRatio: CGFloat = 2/3
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let themes = [Theme(name: "Fruit", emoji: ["🍏", "🍎", "🍒", "🍍", "🍐"], numberOfPairs: 5, color: Color.green)]
        let game = EmojiMemoryGame(themes: themes)
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
