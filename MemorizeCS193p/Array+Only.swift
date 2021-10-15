//
//  Array+Only.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 15/10/2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
