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
    
//    // MARK: - To comprehensively differentiate between cards get the card
//    // property value
//    let card: MemoryGame<String>.Card
    
    // MARK: - Track the rotation of a card for the content to be shown appropriately;
    let rotation: Double
    
    // MARK: - Initialise Cardify with a value for isFaceUp
    // to be supplied by CardView in this case; This boolean will provide a value for rotation;
    init(isFaceUp: Bool) {
        self.rotation = isFaceUp ? 0 : 180
    }
    
    // MARK: - Now isFaceUp becomes a function of a card's rotation
    // < 90 == true > 90 is false
    var isFaceUp: Bool {
        rotation < 90
    }
    
    internal func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill() //.opacity(card.isMatched ? 0.3 : 1)
            }
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    // MARK: - Drawing constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
