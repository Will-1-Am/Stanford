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
            if card.isFaceUp {
                self.front(of: card)
            } else if card.isMatched {
                // MARK: - This condition shows a card face down with opacity after matching
                RoundedRectangle(cornerRadius: cornerRadius)
                    .opacity(matchedCardOpacity)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
        .font(.system(size: fontSize(for: size)))
    }
    
    @ViewBuilder
    private func front(of card: MemoryGame<String>.Card) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            Circle().padding(5).opacity(0.3)
            Text(card.content)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return .minimum(size.width, size.height) * fontScaleFactor
    }
    
    // MARK: - Drawing constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    private let fontScaleFactor: CGFloat = 0.75
    private let matchedCardOpacity: Double = 0.4
}





struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.light)
        }
    }
}
