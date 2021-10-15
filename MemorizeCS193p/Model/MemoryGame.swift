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
            let faceUpCardIndices: Array<Int> = cards.indices.filter { index in
                cards[index].isFaceUp == true
            }
            
            // MARK: - The following for loop that is essentially finding all the
            // indices of the elements that have their isFaceUp property set to
            // true, can be replaced with the array filter function above. The
            // filter function returns a new array from the array it filtered.
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
            
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
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

