//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }

    mutating func choose(card: Card) {
        // MARK: - The value returned from firstIndex(matching:) is optional
        // meaning that it must be unwrapped prior to use. Here optional binding
        // is used to unwrap the returned value otherwise the app will do nothing but will not crash.
        if let tappedCardIndex: Int = cards.firstIndex(matching: card) {
            print("User chose card: \(card) and tappedCardIndex is: \(tappedCardIndex)")
            cards[tappedCardIndex].isFaceUp = !cards[tappedCardIndex].isFaceUp
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

