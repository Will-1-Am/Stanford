//
//  EmojiMemoryGame.swift - VIEW MODEL
//  MemorizeCS193p
//
//  Created by William Spanfelner on 08/10/2021.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    // MARK: - The theme property should be visible by the UI
    private(set) var theme: Theme
    
    // MARK: - Initialise the theme and model properties - force unwrapping the optional first element as this will certainly exist. Utilize the newly created argument for createMemoryGame
    init() {
        self.theme = EmojiMemoryGame.themes.first!
        self.model = EmojiMemoryGame.createMemoryGame(using: theme)
    }
    
    // MARK: - add a new argument to the createMemoryGame function to incorporate the theme into the game creation process
    static func createMemoryGame(using theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.setOfEmoji
        let randomNumberOfPairs = Int.random(in: 2 ... emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsToShow ?? randomNumberOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Setup a basic array of themes for the type
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
