//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

// MARK: - This model is unaware of the UI and will be somewhat generic in the
// types of games that can be created with it. The CardContent type will be
// specified at the time an instance is created.

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    // MARK: - A way of choosing a card is required
    func choose(card: Card) {
        print("User chose card: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        // MARK: - The content on the cards in this game will be emojis, but in
        // other games might be something else (e.g. images, integers, shapes).
        // Since, the actual type is unknown now, but will be known at the time
        // of the actual creation of the game, the MemoryGame declaration needs
        // to be updated to indicate this synonymous with Array.  When the
        // MemoryGame declaration is updated the compiler error "Cannot find
        // type 'CardContent' in scope" will be silenced.
        var content: CardContent
    }
}

