//
//  FinalViewController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/10/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var questions = [(String, String, String, String, String, String)]()
    var score = 0

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Your Score is: " + String(score) + "/" + String(questions.count)
        questionCount.text = String(questions.count)
    

        // Do any additional setup after loading the view.
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
