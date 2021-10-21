//
//  MemoryGame.swift - MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var score: Int {
        // MARK: - Scoring control panel
        let pointsForMatching: Int = 2
        let penaltyForMisMatch: Int = -1
        
        let matchingPoints: Int = cards.filter { $0.isMatched }.count / 2 * pointsForMatching
        let penaltyPoints: Int = cards.filter { $0.timesShown > 1 }.reduce(0, {$0 + $1.timesShown - 1})
        
        return matchingPoints + (penaltyPoints * penaltyForMisMatch)
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let tappedCardIndex: Int = cards.firstIndex(matching: card),
            !cards[tappedCardIndex].isFaceUp,
            !cards[tappedCardIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[tappedCardIndex].content == cards[potentialMatchIndex].content {
                    cards[tappedCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                } else {
                    cards[potentialMatchIndex].timesShown += 1
                    cards[tappedCardIndex].timesShown += 1
                }
                cards[tappedCardIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = tappedCardIndex
            }
//            print("User chose card: \(card), tappedCardIndex is: \(tappedCardIndex) and score is \(score)")
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var timesShown: Int = 0
        var id: Int
    }
}
