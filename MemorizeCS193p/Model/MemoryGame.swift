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
        let matchingPoints: Int = cards.filter { $0.isMatched }.count / 2 * pointsForMatching + bonusPoints
        let penaltyPoints: Int = cards.filter { $0.timesShown > 1 }.reduce(0, {$0 + $1.timesShown - 1})
        
        return matchingPoints + (penaltyPoints * penaltyForMisMatch)
    }
    
    // MARK: - Scoring control panel
    let pointsForMatching: Int = 2
    let maxBonusPoints: Int = 10
    let penaltyForMisMatch: Int = -1

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
            // MARK: - Set the time the first card was chosen - I opted to make this assignment here
            // because had the assignment occurred within the choose(card:) method in its logical
            // place, it is possible that nil will be unwrapped. Hence the reason for its placement
            // in this setter
            timeFirstCardChosen = Date()
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    // MARK: - Create an optional property for the moment that the first card is chosen. It is optional
    // since it isn't possible to know when or if a card will be selected, making it impossible to
    // initialise the property until a card is actually selected.
    var timeFirstCardChosen: Date?
    var elapsedTime: Int = 0
    var bonusPoints: Int = 0
    
    mutating func choose(card: Card) {
        if let tappedCardIndex: Int = cards.firstIndex(matching: card),
            !cards[tappedCardIndex].isFaceUp,
            !cards[tappedCardIndex].isMatched {

            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[tappedCardIndex].content == cards[potentialMatchIndex].content {
                    cards[tappedCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    // MARK: - Compute the time taken to find a matching card and the bonus to award if any
                    elapsedTime = Int(Date().timeIntervalSinceReferenceDate -
                                               timeFirstCardChosen!.timeIntervalSinceReferenceDate)
                    // MARK: - The spec suggests that a max of 10 points be awarded on a declining basis for
                    // each passing second.
                    bonusPoints += max(maxBonusPoints - elapsedTime - pointsForMatching, 0)
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
