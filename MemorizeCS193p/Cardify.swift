//
//  Cardify.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 26/10/2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    let card: MemoryGame<String>.Card
    
    internal func body(content: Content) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else if card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius).opacity(0.3)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
    
    // MARK: - Drawing constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
}

extension View {
    func cardify(_ card: MemoryGame<String>.Card) -> some View {
        return self.modifier(Cardify(card: card))
    }
}
