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
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        // MARK: - Here index(of:) is called on item, but the extension to Array can be called directly on the items array
        let index = items.index(of: item) //self.index(of: item)
        return self.viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
// MARK: - Since this method is looping over the array of items and finding a
// matching index value and a very similar process is happening elsewhere in the
// code, it makes sense to create an extension to Array to do this task.
//    func index(of item: Item) -> Int {
//        for index in 0 ..< items.count {
//            if items[index].id == item.id {
//                return index
//            }
//        }
//        return 0 // FIXME: - BOGUS!!
//    }
}

extension Array where Element: Identifiable {
    func index(of element: Element) -> Int {
        for index in 0 ..< self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return 0 // FIXME: - BOGUS!!
    }
}
