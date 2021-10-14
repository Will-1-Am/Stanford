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

    // MARK: - A property for tracking the only face up card in the UI - optional
    // since there might not have been a card chosen yet (e.g. the game just started).
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(card: Card) {
        // MARK: - tappedCardIndex gets a value only when the first matching
        // card is found in the cards array. Then it "flips" the card over.  It
        // is possible that the card is already face up, so this can be prevented
        // in the optional binding statement. Now, a face up card cannot be
        // tapped and be shown face down because that would be cheating.
        if let tappedCardIndex: Int = cards.firstIndex(matching: card), !cards[tappedCardIndex].isFaceUp {
            print("User chose card: \(card) and tappedCardIndex is: \(tappedCardIndex)")
            cards[tappedCardIndex].isFaceUp = !cards[tappedCardIndex].isFaceUp
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

