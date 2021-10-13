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
    // GridLayout then uses a computed var itemsize to supply a tuple for the
    // width and height of a frame the view will be contained within.
    // GridLayout also provides a "location" method for positioning the center
    // of the view at a specified index
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return self.viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }

    func index(of item: Item) -> Int {
        for index in 0 ..< items.count {
            if items[index].id == item.id {
                return index
            }
        }
        return 0 // FIXME: - BOGUS!!
    }
}
