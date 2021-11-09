//
//  Cardify.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 26/10/2021.
//

import SwiftUI

struct Cardify: ViewModifier {
    // MARK: - To differentiate between matched and unmatched cards get the
    // property value
//    var isFaceUp: Bool
//    var isMatched: Bool
    
    // MARK: - To comprehensively differentiate between cards get the card
    // property value
    let card: MemoryGame<String>.Card
    
    internal func body(content: Content) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill().opacity(card.isMatched ? 0.3 : 1)
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
