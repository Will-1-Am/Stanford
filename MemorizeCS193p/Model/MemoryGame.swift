//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

// MARK: - This model is unaware of the UI and will be somewhat generic in the
// types of games that can be created with it.

struct MemoryGame {
    // MARK: - A memory game needs some cards
    var cards: Array<Card>
    
    // MARK: - A card is really a entity in an of itself with its own properties
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        // MARK: - The content on the cards in this game will be emojis, but in
        // other games might be something else (e.g. images, integers, shapes).
        var content: CardContent
    }
}

