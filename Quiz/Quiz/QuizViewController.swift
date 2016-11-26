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

        var question:String  = questions[currentQuestionIndex] as! String
        self.questionLabel.text = question
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func showQuestion() {
        currentQuestionIndex = currentQuestionIndex + 1
        if(currentQuestionIndex == questionCount) {
            currentQuestionIndex = 0
        }
        
        var question:String  = questions[currentQuestionIndex] as! String
        self.questionLabel.text = question
        self.answerLabel.text = "???"
    }
    
    @IBAction func showAnswer() {
        var answer:String = answers[currentQuestionIndex] as! String
        self.answerLabel.text = answer
    }
}
