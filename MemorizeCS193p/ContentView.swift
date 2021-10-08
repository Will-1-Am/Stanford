//
//  ContentView.swift
//  MemorizeCS193p
//
//  Created by William Spanfelner on 07/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack(content: {
            ForEach(0 ..< 4, content: { index in
                // MARK: - Update the call to CardView to pass in the appropriate value - amend this from true to false observe UI change.
                CardView(isFaceUp: true)
            })
        })
        .foregroundColor(Color.orange)
        .padding()
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    // MARK: - A card will have two sides
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            } else {
                // MARK: - The face down side will be simply filled with the foreground color
                RoundedRectangle(cornerRadius: 10.0)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
