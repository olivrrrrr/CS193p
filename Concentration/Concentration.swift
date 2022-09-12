//
//  Concentration.swift
//  Concentration
//
//  Created by Oliver Ekwalla on 11/09/2022.
//

import Foundation

class Concentration{
    // What are the essentials of the concentration game
    
    var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // From a user perspective, i can choose a card
    
    func chooseCard(at index: Int){
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or two cards faced up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards{
        let card = Card()
        // assigning a struct copies it to variable
        let matchingCard = card
        cards.append(card)
        cards.append(matchingCard)
        // cards += [card, card] 
        }
        // TODO: Shuffle the cards
    }
}
