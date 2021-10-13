//
//  Grid.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 13/10/2021.
//

import SwiftUI

// MARK: - Add the Item & ItemView placeholder types in the Grid definition to clear the
// error messages and allow these to be defined at the point of creation
struct Grid<Item, ItemView>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    // MARK: - @escaping will allow the closure to be provided at some later time
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
