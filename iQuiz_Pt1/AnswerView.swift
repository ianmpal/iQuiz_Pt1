//
//  AnswerView.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/9/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class AnswerView: UIViewController {
    
    var questions = [(String, String, String, String, String, String)]()
    var correctAnswer = false
    var correctAnswerText = ""
    var score = 0
    var questionsLeft = 0

    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var actualAnswer: UILabel!
    
    @IBAction func nextPressed(sender: AnyObject) {
        if questionsLeft > 0 {
            self.performSegueWithIdentifier("answerToQuiz", sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(questions)
        questionText.text = questions[0].0
        
        if correctAnswer {
            answerText.text = "You got it right!"
        } else {
            answerText.text = "Sorry, champ :/"
        }
        
        actualAnswer.text = correctAnswerText

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let qController = segue.destinationViewController as? QuizController {
            qController.questions = questions
            qController.correctAnswer = correctAnswer
            qController.correctAnswerText = correctAnswerText
            qController.questionsLeft = questionsLeft
            
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
