//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

class EmojiMemoryGame {
    // MARK: - Inlining the createCardContent function takes the following form
    // due to type inference (i.e. the closure parameter and return type are
    // inferred by Swift).  Additionally, closure parameter can be replaced by
    // an underscore.
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😀" }
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
