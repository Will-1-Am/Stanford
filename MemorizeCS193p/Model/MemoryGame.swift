//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {
        print("User chose card: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

