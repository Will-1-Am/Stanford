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

    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(card: Card) {
        // MARK: - tappedCardIndex gets a value only when the first matching
        // card is found in the cards array and when that card's isFaceUp
        // property is false. Then it "flips" the tapped card over.  It
        // is possible that the card could already have been matched. This
        // condition can also be prevented in the optional binding statement.
        // This is another cheating preventative.
        if let tappedCardIndex: Int = cards.firstIndex(matching: card),
            !cards[tappedCardIndex].isFaceUp,
            !cards[tappedCardIndex].isMatched {
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

