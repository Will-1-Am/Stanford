//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

class EmojiMemoryGame {
    // FIXME: - "Class 'EmojiMemoryGame' has no initializers" means there is a
    // property that doesn't have a way to have a value if the class were to be
    // instantiated now.
    private var model: MemoryGame<String>
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
