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
    
    
    // The type understands this function, it is a utility function that works inside of the Card struct
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    // Inits tend to have same internal and external name, hence self. means the cards identifier
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
