//
//  ViewController.swift
//  Concentration
//
//  Created by Oliver Ekwalla on 11/09/2022.
//

import UIKit

class ViewController: UIViewController {

    var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    let emojiChoices = ["👻", "🎃"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
    
        if let cardNumber = cardButtons.index(of: sender){
            print("card number: \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            flipCount+=1
        } else {
            print("This is incorrect")
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

