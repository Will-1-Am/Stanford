//
//  MemorizeCS193pApp.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 07/10/2021.
//

import SwiftUI

@main
struct MemorizeCS193pApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
