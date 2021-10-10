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

    // MARK: [By default, the properties of a value type can’t be modified from within its instance methods.](https://docs.swift.org/swift-book/LanguageGuide/Methods.html) So, an attempt to
    // amend the cards array will produce a compiler error "Cannot assign to property: 'self'
    // is immutable" unless the method is marked mutating
    mutating func choose(card: Card) {
        let tappedCardIndex: Int = self.index(of: card)
        print("User chose card: \(card) and tappedCardIndex is: \(tappedCardIndex)")
        cards[tappedCardIndex].isFaceUp = !cards[tappedCardIndex].isFaceUp
    }
    
    func index(of tappedCard: Card) -> Int {
        for card in cards {
            if card.id == tappedCard.id {
                return tappedCard.id
            }
        }
        return 0  // FIXME: - Bogus
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

