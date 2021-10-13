//
//  Grid.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 13/10/2021.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    // MARK: - Positioning each view requires an index value by GridLayout
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return self.viewForItem(item)
    }
    
    // MARK: - Ensure that the item is actually contained in the items array
    func index(of item: Item) -> Int {
        for index in 0 ..< items.count {
            if items[index].id == item.id {
                return index
            }
        }
        return 0 // FIXME: - BOGUS!!
    }
}
