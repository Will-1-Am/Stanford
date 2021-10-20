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
        // MARK: - It made more sense to convert score into a computed property - meaning that the score initialisation was unecessary in the following initialiser, along with the flippedCards array and the computeScore method
        // MARK: - Scoring control panel
        let pointsForMatching: Int = 2
        let penaltyForMisMatch: Int = -1
        
        // MARK: - Compute the score for matched cards using the filter function
        let matchingPoints: Int = cards.indices.filter { cards[$0].isMatched }.count / 2 * pointsForMatching
        
        // MARK: - Computer the penalty points if any to deduct
        let penaltyPoints: Int = cards.indices.reduce(0) { (partialResult, next) -> Int in
            if cards[next].timesShown > 1 {
                return partialResult + cards[next].timesShown - 1
            } else {
                return partialResult
            }
        }
        
        // MARK: - Find the total score
        return matchingPoints + (penaltyPoints * penaltyForMisMatch)
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
//        score = 0
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
                    
                    
                    print("We have a match!")
                    // MARK - Award points for match and update score
//                    computeScore(cardsMatching: true)
                } else {
                    // MARK - Add to the timesShown count (new Card property) since the revealed cards didn't match
                    cards[potentialMatchIndex].timesShown += 1
                    cards[tappedCardIndex].timesShown += 1
                    print("No match. Index \(tappedCardIndex) with content \(cards[tappedCardIndex].content) & index \(potentialMatchIndex) with content \(cards[potentialMatchIndex].content) have been shown \(cards[tappedCardIndex].timesShown) and \(cards[potentialMatchIndex].timesShown) time(s) respectively")
                    
                    // MARK - Update the score using the indices of the two mismatched cards
//                    computeScore(cardsMatching: false, cardIndex: [tappedCardIndex, potentialMatchIndex])
                }
                cards[tappedCardIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = tappedCardIndex
                print("The one and only face up card has just flipped.")
            }
            print("User chose card: \(card), tappedCardIndex is: \(tappedCardIndex) and score is \(score)")
        }
    }
    
//    var flippedCards = Array<Int>()
//
//    mutating func computeScore(cardsMatching: Bool, cardIndex: [Int]? = nil) {
//        // Score control panel
//        let pointsForMatching: Int = 2
//        let penaltyForMisMatch: Int = -1
//
//        // MARK: - Indices passed in for penalties?
//        if let cardIndex = cardIndex {
//            // MARK: - Add those indices to the flippedCards array
//            for index in cardIndex {
//                flippedCards.append(index)
//            }
//
//            // MARK: - Loop over the array of indices passed in
//            for index in cardIndex {
//                // MARK: - If the flippedCards array contains each index,
//                if flippedCards.contains(index) {
//
//                    // MARK: - Count the occurances of each index in the array
//                    let timesCardShown = flippedCards.indices.filter { flippedCards[$0] == index }.count
//
//                    // MARK: - Update the score if the count of each index >= 2 othewise the score is updated with 0 penalty points
//                    score += timesCardShown >= 2 ? timesCardShown * penaltyForMisMatch - 1 : 0
//                    print("penalty points \(timesCardShown * penaltyForMisMatch)")
//                }
//            }
//
//        } else {
//            score += pointsForMatching
//        }
//        print(flippedCards)
//    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var timesShown: Int = 0
        var id: Int
    }
}
