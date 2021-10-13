//
//  Grid.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 13/10/2021.
//

import SwiftUI

// MARK: - A Grid of cards, in this case, will be constructed for the UI.
// The grid struct will be generic so as to cope with other grid content.
struct Grid: View {
    // MARK: - The EmojiMemoryGame uses cards - more generically items
    var items: [Item]
    // MARK: - For each item a view will be returned
    var viewForItem: (Item) -> ItemView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
