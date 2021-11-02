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
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(5)
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 70 - 90), clockwise: true).padding(5).opacity(0.3)
            Text(card.content).rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: true), value: card.isMatched)
        }
        .cardify(card)
        .font(.system(size: fontSize(for: size)))
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
