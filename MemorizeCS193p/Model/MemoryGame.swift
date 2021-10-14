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
                    cards[tappedCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // MARK: - Since a match was found indexOfTheOneAndOnlyFaceUpCard needs resetting
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                // MARK: - Turn the cards face down since indexOfTheOneAndOnlyFaceUpCard is nil
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                
                // MARK: - Tell MemoryGame the value for indexOfTheOneAndOnlyFaceUpCard
                indexOfTheOneAndOnlyFaceUpCard = tappedCardIndex
            }
            // MARK: - Now turn that tapped card face up
            cards[tappedCardIndex].isFaceUp = true
            print("User chose card: \(card) and tappedCardIndex is: \(tappedCardIndex)")
// MARK: - This line is no longer necessary due to the logic above.
//            cards[tappedCardIndex].isFaceUp = !cards[tappedCardIndex].isFaceUp
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

