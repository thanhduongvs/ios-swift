//
//  HomeViewController.swift
//  swift 02 dicee
//
//  Created by Thanh Duong on 8/24/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var randomDice1 : Int = 0
    var randomDice2 : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceeImage1: UIImageView!
    @IBOutlet weak var diceeImage2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImage()
    }

    @IBAction func rollPressed(_ sender: UIButton) {
        updateDiceImage()
    }
    
    func updateDiceImage() {
        randomDice1 = Int(arc4random_uniform(6))
        randomDice2 = Int(arc4random_uniform(6))
        
        diceeImage1.image = UIImage(named: diceArray[randomDice1])
        diceeImage2.image = UIImage(named: diceArray[randomDice2])
    }
    
}
