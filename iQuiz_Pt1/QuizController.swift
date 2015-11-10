//
//  QuizController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/5/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class QuizController: UIViewController {
    
    var questions = [(String, String, String, String, String, Int)]()

    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBAction func answerOnePressed(sender: AnyObject) {
        print("test1")
    }
    
    @IBOutlet weak var answerTwo: UIButton!
    @IBAction func answerTwoPressed(sender: AnyObject) {
        print("test2")
    }
    
    
    @IBOutlet weak var answerThree: UIButton!
    @IBAction func answerThreePressed(sender: AnyObject) {
        print("test3")
    }

    @IBOutlet weak var answerFour: UIButton!
    @IBAction func answerFourPressed(sender: AnyObject) {
        print("test4")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionText.text = questions[0].0

        answerOne.setTitle(questions[0].1, forState: .Normal)
        
        answerTwo.setTitle(questions[0].2, forState: .Normal)
        
        answerThree.setTitle(questions[0].3, forState: .Normal)
        
        answerFour.setTitle(questions[0].4, forState: .Normal)
        
        print(questions[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
