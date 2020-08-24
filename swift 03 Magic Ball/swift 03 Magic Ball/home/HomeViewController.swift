//
//  HomeViewController.swift
//  swift 03 Magic Ball
//
//  Created by Thanh Duong on 8/24/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBall = 0
    
    @IBOutlet weak var ballImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateBallImage()
    }

    @IBAction func askPressed(_ sender: UIButton) {
        updateBallImage()
    }
    
    func updateBallImage() {
        randomBall = Int(arc4random_uniform(5))
        ballImage.image = UIImage(named: ballArray[randomBall])
    }
}
