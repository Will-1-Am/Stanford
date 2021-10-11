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
        return HStack(content: {
            ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            })
        })
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
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
        // MARK: - Refactoring the font modifier can be done if the type expected by the system size argument is known - CGFloat from dev docs.
        .font(.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        return .minimum(size.width, size.height) * fontScaleFactor
    }
    
    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
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
