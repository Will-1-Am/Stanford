//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation
// MARK: - createCardContent fulfills the type requirement of the
// cardContactFactory (Int) -> CardContent (in this case a String)
func createCardContent(pairIndex: Int) -> String {
    return "😀"
}

class EmojiMemoryGame {
    // FIXME: - "Class 'EmojiMemoryGame' has no initializers" means there is a
    // property that doesn't have a way to have a value if the class were to be
    // instantiated now.
    // FIX - Assign an instance of the MemoryGame using its initialiser and the
    // createCardContent function
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent)
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
