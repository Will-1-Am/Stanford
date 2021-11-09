//
//  EmojiMemoryGameView.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 07/10/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        // MARK: - Make room for a button to start a new game
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 2)) {
                        viewModel.choose(card: card) 
                    }
                }
                .padding(5)
            }
            .foregroundColor(Color.orange)
            .padding()
            
            Button {
                withAnimation(.easeInOut(duration: 2)) {
                    viewModel.resetGame() }
            } label: {
                Text("New Game")
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 70 - 90), clockwise: true).padding(5).opacity(0.3)
                Text(card.content).rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: card.isMatched == true)
            }
            .cardify(card)
            .font(.system(size: fontSize(for: size)))
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return .minimum(size.width, size.height) * fontScaleFactor
    }
    
    // MARK: - Drawing constants
    private let fontScaleFactor: CGFloat = 0.75
    private let matchedCardOpacity: Double = 0.4
}





struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return Group {
            EmojiMemoryGameView(viewModel: game)
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.light)
        }
    }
}
