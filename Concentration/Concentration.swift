//
//  Concentration.swift
//  Concentration
//
//  Created by Oliver Ekwalla on 11/09/2022.
//

import Foundation

class Concentration
{
    // What are the essentials of the concentration game
    
    var cards = Array<Card>()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // if you always start game at 0, you can initilize it at the top
    var score: Int = 0
    
    var flipCount : Int = 0
    
    var previouslySelectedCards = Array<Int>()
    // From a user perspective, i can choose a card
    
    func chooseCard(at index: Int){
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        
        // ignore a card that has already been matched
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
    
    // function should do one thing and one thing only
    func concentrationScore(at index: Int) {
        // index is the button that was pressed
        if !cards[index].isMatched {
            previouslySelectedCards.append(index)
            print(cards[index].identifier)
            print("index \(index)")
            print("previously selected card: \(previouslySelectedCards[0..<previouslySelectedCards.count-1])")

        // when there is one and only one faced up card and you have to choose a different card
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            print("matchIndex \(matchIndex)")
            // check if cards match
            if cards[matchIndex].identifier == cards[index].identifier {
                score += 2
                print("points: \(score)")
                print("identifier: \(cards[matchIndex].identifier) \(cards[index].identifier)")
            }else if  previouslySelectedCards[0..<previouslySelectedCards.count-1].contains(index){
               score -= 1
               print("matchIndex \(matchIndex)")
               print("negative")
               print("score \(score)")
           }
        }
    }
}
    
// if the card you select has been previously selected -1 point
// store all cards selected into an array
    
    
    func numberOfCardFlips(){
        // if card is flipped
        // increment card flipCount by 1
            flipCount += 1
    }
    
    init(numberOfPairsOfCards: Int){
        // for in "a sequence" (countable range)
        for _ in 0..<numberOfPairsOfCards{
        let card = Card()
        // assigning a struct copies it to variable
        let matchingCard = card
        cards.append(card)
        cards.append(matchingCard)
        // cards += [card, card]
        }
        // TODO: Shuffle the cards
        cards.shuffle()
    }
}

