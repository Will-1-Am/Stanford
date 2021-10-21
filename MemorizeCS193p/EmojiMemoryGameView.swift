//
//  EmojiMemoryGameView.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 07/10/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Group {
                Text(viewModel.theme.name).font(.largeTitle)
                Text("Score: \(viewModel.score)")
                Grid(viewModel.cards) { card in
                    CardView(viewModel: viewModel, card: card).onTapGesture {
                        viewModel.choose(card: card)
                    }
                    .padding(5)
                }
                .padding()
            }
            .foregroundColor(viewModel.theme.themeColor)
            
            Button(action: { viewModel.startNewGame() }) {
                Text("New Game")
            }
        }
    }
}

struct CardView: View {
    // MARK: - Get access to the theme via the viewModel
    var viewModel: EmojiMemoryGame
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius).fill(applyGradientWith(viewModel.theme.themeColor))
            }
        }
        .font(.system(size: fontSize(for: size)))
    }
    
    // MARK: - The applyGradientWith(color:) method does all the heavy lifting
    func applyGradientWith(_ color: Color) -> LinearGradient {
        let opacity: Double = 0.6
        let gradientColor: Color = color
        let gradient: Gradient = Gradient(colors: [gradientColor.opacity(opacity), gradientColor, .white])
        let startPoint: UnitPoint = .topLeading
        let endPoint: UnitPoint = .bottomTrailing
        
        return LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        return .minimum(size.width, size.height) * fontScaleFactor
    }
    
    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
}





struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.light)
        }
    }
}
