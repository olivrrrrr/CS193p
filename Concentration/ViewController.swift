//
//  ViewController.swift
//  Concentration
//
//  Created by Oliver Ekwalla on 11/09/2022.
//

import UIKit

class ViewController: UIViewController {
    // Keep it stupid simple
    
    // Controller point to model
    // lazy doesnt actually initialize until someone tries to use it
    // lazy initializes the concentration game
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count+1) / 2)
    
    var emojiChoices = ["👻", "🎃", "😈", "👽", "🧛🏿‍♂️", "👹","💀", "🧟‍♂️", "🧙‍♂️","🧌"]
    
    let emojiChoices1 = [
                         1:["👻", "🎃", "😈", "👽", "🧛🏿‍♂️", "👹","💀", "🧟‍♂️", "🧙‍♂️","🧌"],
                         2:["⚽️", "🏈", "🏐", "🏉", "🎱", "🏑", "⛷", "🥍", "🥊", "🎾"],
                         3:["🥸","🤩","🫡","🫣","😱","🥶","🥳","😴","🤒","🤠", "🤫"],
                         4:["🐱","🦆","🐢","🐨","🦀","🐬","🐝","🦋","🐑","🦎", "🦙"],
                         5: ["🍎","🥦","🥩","🥨","🍕","🌮","🥗","🫒","🍳","🫐", "🌽"],
                         6: ["🚗","🚑","🚁","🛸","🚂","🛰","⛴","⛵️","🛵","🏎", "🚠"]
                        ]
    
    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var scoreCount : Int = 10 {
        didSet{
            scoreCountLabel.text = "Score: \(scoreCount)"
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        // reset number of flips back to zero
        flipCount = 0
        scoreCount = 0
     
        // reset number of cards back to maximum
        game = Concentration(numberOfPairsOfCards: (cardButtons.count+1) / 2)
        // repopulate the emojis in emojiChoices
        // emojiChoices = ["👻", "🎃", "😈", "👽", "🧛🏿‍♂️", "👹","💀", "🧟‍♂️", "🧙‍♂️","🧌"]
//        print(emojiChoices1[2])
//        print(emojiChoices)
     //   print(emojiChoices)
        if let randomKey = emojiChoices1.keys.randomElement() {
          emojiChoices = emojiChoices1[randomKey] ?? []
        }
        
//        let emojiArray = Array(emojiChoices1.values)
//        print(emojiArray)
//        print(emojiArray.count)
        updateViewFromModel()
    }
    
   @IBOutlet var cardButtons: [UIButton]!
    
   @IBOutlet weak var flipCountLabel: UILabel!
    
   @IBOutlet weak var scoreCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            print("card number: \(cardNumber)")
            /// flipCount += 1
            flipCount = game.flipCount
            scoreCount = game.score
            game.numberOfCardFlips()
            game.concentrationScore(at: cardNumber)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("This is incorrect")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
   
    // Look up the emoji identifer to look up the emoji that goes on that card
    var emoji = Dictionary<Int,String>()
    
//    var emojiArray = Array<Int, Array>()
    
    func emoji(for card: Card) -> String {
        
//        var emojiArray = Array(emojiChoices1.values)
//
//       // let randomKey = Int(arc4random_uniform(UInt32(Array(emojiArray.count))))
//        // a random numbr to be picked from the dictonary
//        // if the emoji in that card is nil, then I will put an emoji in the dictionary for that card
//        if emoji[card.identifier] == nil, emojiArray[randomKey].count > 0 {
//            // pseudo-random number generator
//            let randomIndex = Int(arc4random_uniform(UInt32(emojiArray[randomKey].count)))
//            // Looking up an emoji in the dictionary
//            // Remove at random index returns the string
//            // print(emojiArray[randomKey].remove(at: randomIndex))
//            emoji[card.identifier] = emojiArray[randomKey].remove(at: randomIndex)
//        }
        
// Looking up something in a string returns a dictionary
// One way to deal with an optional
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        
//        return emoji[card.identifier]! ?? "?"
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }

        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
    
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

