//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

// MARK: - EmojiMemoryGame will be the view model and will express intents to
// access the model on behalf of the view

class EmojiMemoryGame {
    // MARK: - An EmojiMemoryGame needs to have cards, and a way to choose those
    // cards -  model is specified here with CardContent of type String and
    // marked private since only EmojiMemoryGame should have access to it.
    private var model: MemoryGame<String>
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents allow a view to "speak" to the model adn request that
    // actions be performed on the model.  A view would be able to see the model
    // but, would not be able to change the model without intents.
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
