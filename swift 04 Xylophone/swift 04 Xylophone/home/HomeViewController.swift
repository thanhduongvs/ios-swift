//
//  HomeViewController.swift
//  swift 04 Xylophone
//
//  Created by Thanh Duong on 8/24/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer!
    let sounds = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var selectedSound = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func notePressed(_ sender: UIButton) {
        selectedSound = sounds[sender.tag]
        playSound()
    }
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: selectedSound, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }


}
