//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>

    private(set) var theme: Theme

    init() {
        self.theme = EmojiMemoryGame.themes.first!
        self.model = EmojiMemoryGame.createMemoryGame(using: theme)
    }

    static func createMemoryGame(using theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.setOfEmoji
        let randomNumberOfPairs = Int.random(in: 2 ... emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsToShow ?? randomNumberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }

    static var themes: Array<Theme> = [
        Theme()
    ]
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
