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
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: size)
        }
    }
    
    // MARK: - Refactor the body of the ForEach from body(for:)
    func body(for item: Item, in size: CGSize) -> some View {
        self.viewForItem(item)
    }
}
