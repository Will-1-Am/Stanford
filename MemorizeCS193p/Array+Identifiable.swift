//
//  Array+Identifiable.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 14/10/2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0 ..< self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        // MARK: - Changing the return type to optional (by adding the "?")
        // permits the use of the default value of an optional type (e.g. nil)
        // instead of a value known to be incorrect.
        return nil
    }
}
