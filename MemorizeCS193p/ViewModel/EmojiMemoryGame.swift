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

    // MARK: - startNewGame should chose a random theme and create a new game using it
    func startNewGame() {
        self.theme = EmojiMemoryGame.themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(using: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(name: "Halloween", setOfEmoji: ["👻", "🎃", "🌭", "👾", "☠️", "🍎", "🧙‍♀️", "🌛", "👹", "👾", "🎭", "🕷", "⚰️", "👽", "🍬"], numberOfPairsToShow: 6, themeColor: .orange),
        Theme(name: "Animals", setOfEmoji: ["🐼", "🐔", "🦄", "🐒", "🐰", "🐺"], themeColor: .pink),
        Theme(name: "Sport", setOfEmoji: ["🏀", "🏈", "⚾", "⚽️", "🎾", "⛷", "⛸", "🏄", "⛳️"], themeColor: .yellow),
        Theme(name: "Faces", setOfEmoji: ["😀", "😢", "😉"], themeColor: .red),
        Theme(name: "Travel", setOfEmoji: ["✈️", "🚁", "⛵️", "🚅", "🏍", "🚗", "🚲"], numberOfPairsToShow: 7, themeColor: .blue),
        Theme(name: "Fruit", setOfEmoji: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"], numberOfPairsToShow: 9, themeColor: .green)
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
