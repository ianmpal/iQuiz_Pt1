//
//  AnswerView.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/9/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class AnswerView: UIViewController {
    
    var questions = [Array<String>()]
    var correctAnswer = false
    var correctAnswerText = ""
    var score = 0
    var questionsLeft = 0
    var currentQuestion = 0
    var quizName = ""
    var questionTextString = ""

    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var actualAnswer: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextPressed(sender: AnyObject) {
        nextButton.layer.backgroundColor = UIColor.whiteColor().CGColor
        if questionsLeft > 0 {
            self.performSegueWithIdentifier("answerToQuiz", sender: nil)
        } else {
            self.performSegueWithIdentifier("finalSegue", sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = quizName
        self.navigationItem.setHidesBackButton(true, animated: false)
        nextButton.layer.borderWidth = 2.0
        nextButton.layer.borderColor = UIColor(white: 1.0, alpha: 100).CGColor
        questionText.text = questionTextString
        
        if correctAnswer {
            answerText.text = "You got it right! The correct answer is: "
        } else {
            answerText.text = "Oops! That's wrong. The correct answer is: "
        }
        
        actualAnswer.text = correctAnswerText
        currentQuestion++

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if questionsLeft > 0 {
        
            if let qController = segue.destinationViewController as? QuizController {
                qController.questions = questions
                qController.correctAnswer = correctAnswer
                qController.correctAnswerText = correctAnswerText
                qController.questionsLeft = questionsLeft
                qController.currentQuestion = currentQuestion
                qController.score = score
                qController.quizName = quizName
            }
        } else {
            
            if let fController = segue.destinationViewController as? FinalViewController {
                fController.score = score
                fController.questions = questions
                fController.quizName = quizName
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
