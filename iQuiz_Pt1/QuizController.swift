//
//  QuizController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/5/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
    
    var questions = [(String, String, String, String, String, String)]()
    
    var answerSelected = false
    var correctAnswer = false
    var correctAnswerText = ""
    var score = 0

    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBAction func answerOnePressed(sender: AnyObject) {
        answerSelected = true
        if questions[0].1 == correctAnswerText {
            correctAnswer = true
        }
    }
    
    @IBOutlet weak var answerTwo: UIButton!
    @IBAction func answerTwoPressed(sender: AnyObject) {
        answerSelected = true
        if questions[0].2 == correctAnswerText {
            correctAnswer = true

        }
       
    }
    
    
    @IBOutlet weak var answerThree: UIButton!
    @IBAction func answerThreePressed(sender: AnyObject) {
        answerSelected = true
        if questions[0].3 == correctAnswerText {
            correctAnswer = true
        }

    }

    @IBOutlet weak var answerFour: UIButton!
    @IBAction func answerFourPressed(sender: AnyObject) {
        answerSelected = true
        if questions[0].4 == correctAnswerText {
            correctAnswer = true
        }

    }
    
    
    
    @IBAction func submitPressed(sender: AnyObject) {
        checkAnswer()
    }
    
    
    func checkAnswer() {
        if answerSelected == false {
            let alertController = UIAlertController(title: "Please select an answer before continuing", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.performSegueWithIdentifier("answer", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctAnswerText = questions[0].5

        questionText.text = questions[0].0

        answerOne.setTitle(questions[0].1, forState: .Normal)
        
        answerTwo.setTitle(questions[0].2, forState: .Normal)
        
        answerThree.setTitle(questions[0].3, forState: .Normal)
        
        answerFour.setTitle(questions[0].4, forState: .Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let aController = segue.destinationViewController as? AnswerView {
            aController.questions = questions
            aController.correctAnswer = correctAnswer
            aController.correctAnswerText = correctAnswerText
            
            //print("Hit prepareforSegue")
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


