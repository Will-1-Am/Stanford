//
//  Pie.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 26/10/2021.
//

import SwiftUI

struct Pie: Shape {
    // MARK: - Pass in start and end angles to draw the arc of the pie
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        // MARK: - Compute the start point - note radius is undefined
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)), y: center.y + radius * sin(CGFloat(startAngle.radians)))
        var p = Path()
        p.move(to: center)
        
        // MARK: - Add a line from the center to the start point
        p.addLine(to: start)
        
        return p
    }
}
