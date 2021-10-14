//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
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
        if let tappedCardIndex: Int = cards.firstIndex(matching: card),
            !cards[tappedCardIndex].isFaceUp,
            !cards[tappedCardIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[tappedCardIndex].content == cards[potentialMatchIndex].content {
                    // MARK: - Mark cards as matched
                    cards[tappedCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            }
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

