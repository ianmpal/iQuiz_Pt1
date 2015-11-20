//
//  QuizController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/5/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
    
    //var questions = [NSDictionary]()
    var questions = [Array<String>()]

    
    var answerSelected = false
    var correctAnswer = false
    var correctAnswerInt = 0
    var correctAnswerText = ""
    var score = 0
    var questionsLeft = 0
    var currentQuestion = 0
    var quizName = ""
    var questionTextString = ""

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.title = quizName
        
        
        submitButton.layer.borderWidth = 2.0
        submitButton.layer.borderColor = UIColor(white: 1.0, alpha: 100).CGColor
        
        print("")
        print(questions[currentQuestion])
        
        correctAnswerText = questions[currentQuestion][5]
        questionTextString = questions[currentQuestion][0]
        questionText.text = questionTextString
        
//        correctAnswerInt = questions[currentQuestion]["answer"]
       // correctAnswerInt = (questions[currentQuestion]["answer"])!).integerValue
        
               

        
        //correctAnswerText = answersDict[0 as AnyObject]
        
        //correctAnswerInt = Int(questions[currentQuestion]["answer"] as! String)!

        //correctAnswerText = String(questions[currentQuestion]["answers"][0])

        
        //correctAnswerText = String(questions[currentQuestion]["answers"]!.correctAnswerInt)
        
        
        //questionText.text = questions[currentQuestion]["text"] as? String
        
//        print("qustion text: " + questionText.text!)
//        print("answer text: " + correctAnswerText)
//        print("correctAnswerInt: " + String(correctAnswerInt))
        
        answerOne.setTitle(questions[currentQuestion][1], forState: .Normal)
        
        answerTwo.setTitle(questions[currentQuestion][2], forState: .Normal)
        
        answerThree.setTitle(questions[currentQuestion][3], forState: .Normal)
        
        answerFour.setTitle(questions[currentQuestion][4], forState: .Normal)
        
    }
    
    @IBOutlet weak var answerOne: UIButton!
    @IBAction func answerOnePressed(sender: AnyObject) {
        answerTwo.hidden = true
        answerThree.hidden = true
        answerFour.hidden = true
        answerSelected = true
        if questions[currentQuestion][1] == correctAnswerText {
            correctAnswer = true
            score++
        }
    }
    
    @IBOutlet weak var answerTwo: UIButton!
    @IBAction func answerTwoPressed(sender: AnyObject) {
        answerSelected = true
        answerOne.hidden = true
        answerThree.hidden = true
        answerFour.hidden = true
        if questions[currentQuestion][2] == correctAnswerText {
            correctAnswer = true
            score++

        }
       
    }
    
    
    @IBOutlet weak var answerThree: UIButton!
    @IBAction func answerThreePressed(sender: AnyObject) {
        answerSelected = true
        answerOne.hidden = true
        answerTwo.hidden = true
        answerFour.hidden = true
        if questions[currentQuestion][3] == correctAnswerText {
            correctAnswer = true
            score++
        }

    }

    @IBOutlet weak var answerFour: UIButton!
    @IBAction func answerFourPressed(sender: AnyObject) {
        answerSelected = true
        answerOne.hidden = true
        answerTwo.hidden = true
        answerThree.hidden = true
        if questions[currentQuestion][4] == correctAnswerText {
            correctAnswer = true
            score++
        }

    }
    
    
    
    @IBAction func submitPressed(sender: AnyObject) {
        if answerSelected {
            submitButton.layer.backgroundColor = UIColor.whiteColor().CGColor
        }
        questionsLeft--
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
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let aController = segue.destinationViewController as? AnswerView {
            aController.questions = questions
            aController.correctAnswer = correctAnswer
            aController.correctAnswerText = correctAnswerText
            aController.questionsLeft = questionsLeft
            aController.score = score
            aController.currentQuestion = currentQuestion
            aController.quizName = quizName
            aController.questionTextString = questionTextString
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


