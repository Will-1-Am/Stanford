//
//  Grid.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 13/10/2021.
//

import SwiftUI

struct Grid: View {
    // MARK: - The "Cannot find type 'Item' in scope" error is flagging that the
    // compiler doesn't know what an Item is.  The Item type will have to be
    // specified at the time an instance of the struct is created - in this case
    // an initialiser can be used
    var items: [Item]
    
    // MARK: - The "Cannot find type 'ItemView' in scope" error is just saying
    // that ItemView is also unknown
    var viewForItem: (Item) -> ItemView
    
    // MARK: - While this is generic struct, an array of cards will be the items here
    init(_ items: [Item], viewForItem: (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
