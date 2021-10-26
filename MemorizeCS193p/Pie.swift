//
//  Pie.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 26/10/2021.
//

import SwiftUI

struct Pie: Shape {
    // MARK: - path(in:) is provided for free to conform to the Shape protocol
    func path(in rect: CGRect) -> Path {
        // MARK: - find the center of the rect
        let center = CGPoint(x: rect.midX, y: rect.midY)
        // MARK: - create a path and move it to the center of the rect
        var p = Path()
        p.move(to: center)
        
        return p
    }
}
