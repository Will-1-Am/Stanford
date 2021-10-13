//
//  Grid.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 13/10/2021.
//

import SwiftUI

// MARK: - Constrain Item to Identifiable and ItemView to View - without those
// constrains the compiler will display the error "No exact matches in call to
// initializer" - since Item was essentially pulled out of thin air and it has
// never been made to conform to Identifiable as required by ForEach.
// Additionally, the compiler also doesn't know anything about ItemView.
struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        // MARK: - Create a ForEach view using the items array and return a
        // view for each item
        ForEach(items) { item in
            self.viewForItem(item)
        }
    }
}
