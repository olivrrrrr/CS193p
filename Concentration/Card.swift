//
//  Card.swift
//  Concentration
//
//  Created by Oliver Ekwalla on 11/09/2022.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // This card is UI independent, so no emoji
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    // Inits tend to have same internal and external name, hence self. means the cards identifier
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
