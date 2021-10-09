//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    // MARK: - A MemoryGame wants to be created for a known number of pairs of
    // cards and then create an array of cards - the deck in other words - from
    // which to play the game. numberOfPairsOfCards will be the known number of
    // pairs of type integer.  cardContentFactory will take a closure of type
    // integer and return CardContent
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            // MARK: - The CardContent type must have to call a function with the
            // pairIndex to create the two cards in each pair
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex * 2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex * 2 + 1))
        }
    }

    func choose(card: Card) {
        print("User chose card: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}

