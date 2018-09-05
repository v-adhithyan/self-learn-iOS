//
//  QuizViewController.swift
//  Quiz
//
//  Created by Adhithyan Vijayakumar on 26/11/16.
//  Copyright © 2016 Adhithyan Vijayakumar. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!  

    let questions: NSArray = ["What is my name?", "What is my roll no?", "What is capital of TN?"]
    let answers: NSArray = ["Adhithyan", "2011103592", "Chennai"]
    
    var currentQuestionIndex = 0
    var questionCount = 3
    override func viewDidLoad() {
        super.viewDidLoad()

        let question  = questions[currentQuestionIndex] as! String
        self.questionLabel.text = question
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showQuestion() {
        currentQuestionIndex = currentQuestionIndex + 1
        if(currentQuestionIndex == questionCount) {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex] as! String
        self.questionLabel.text = question
        self.answerLabel.text = "???"
    }
    
    @IBAction func showAnswer() {
        let answer = answers[currentQuestionIndex] as! String
        self.answerLabel.text = answer
    }
}
