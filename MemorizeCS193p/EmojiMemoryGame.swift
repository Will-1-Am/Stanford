//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

class EmojiMemoryGame {
    // MARK: - Provide ability to create a game from an array of emojis
    private var model: MemoryGame<String> = createMemoryGame()
    
    // MARK: - Add a function that will use an array to create the CardContent
    func createMemoryGame() -> MemoryGame<String> {
        // MARK: - Make two pairs to start
        let emojis: Array<String> = ["👻", "🎃"]
        MemoryGame<String>(numberOfPairsOfCards: 2) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
