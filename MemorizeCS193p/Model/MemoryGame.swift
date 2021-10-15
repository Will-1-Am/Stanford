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

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            // MARK: - faceUpCardIndices can be further simplified by removing the index
            // closure parameter and replacing the element subscript with $0. Additionally,
            // it is unnecessary to explicitly state the true boolean value as this is inferred.
            let faceUpCardIndices: [Int] = cards.indices.filter { cards[$0].isFaceUp }
            
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
            
            // MARK: - The following ternary expression replaces the if else statement above
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
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
                }
                cards[tappedCardIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = tappedCardIndex
            }
            print("User chose card: \(card) and tappedCardIndex is: \(tappedCardIndex)")
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

