//
//  ViewController.swift
//  Concentration
//
//  Created by Oliver Ekwalla on 11/09/2022.
//

import UIKit

class ViewController: UIViewController {

    // Controller point to model
    // lazy doesnt actually initialize until someone tries to use it
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count+1) / 2)
    
    
    var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
    
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("card number: \(cardNumber)")
            flipCount+=1
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
    
    var emojiChoices = ["👻", "🎃", "😈", "👽", "🧛🏿‍♂️", "👹"]
    
    var emoji = Dictionary<Int,String>()
    
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count>0{
            
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

