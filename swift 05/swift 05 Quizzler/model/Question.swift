//
//  File.swift
//  swift 05 Quizzler
//
//  Created by Thanh Duong on 8/25/20.
//  Copyright © 2020 Thanh Duong. All rights reserved.
//

import Foundation

class Question {
    let answer : Bool
    let questionText : String
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}
