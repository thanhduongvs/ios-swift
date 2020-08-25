//
//  HomeViewController.swift
//  swift 05 Quizzler
//
//  Created by Thanh Duong on 8/25/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        
        else if sender.tag == 0 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        updateUI()
    }
    
    func updateUI() {
        let width = view.frame.size.width / 13
        progressBar.frame.size.width = (width*CGFloat(questionNumber + 1))
        progressLabel.text = String(questionNumber) + "/13"
        scoreLabel.text = "Score: " + String(score)
        
        nextQuestion()
    }
    
    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the question, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                UIAlertAction in self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func startOver() {
       
        questionNumber = 0
        score = 0
        
        updateUI()
    }
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            //ProgressHUD.showSuccess("Correct!")
            score = score + 1
        }
        else {
            //ProgressHUD.showError("Wrong!")
        }
        
        
    }
    

}
