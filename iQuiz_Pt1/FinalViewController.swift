//
//  FinalViewController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/10/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    var questions = [Array<String>()]
    var score = 0
    var percent: Double = 0.0
    var finalPercent: Double = 0.0
    var quizName = ""
    var quizzesAll = [NSDictionary]()



    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var bigPercent: UIButton!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBAction func finishedPressed(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = quizName
        self.navigationItem.setHidesBackButton(true, animated: false)
        finishButton.layer.borderWidth = 2.0
        finishButton.layer.borderColor = UIColor(white: 1.0, alpha: 100).CGColor
        bigPercent.layer.borderWidth = 2.0
        bigPercent.layer.borderColor = UIColor(white: 1.0, alpha: 100).CGColor
        percent = (Double(score) / Double(questions.count))*100
        finalPercent = Double(round(1000*percent)/1000)
        bigPercent.setTitle(String(finalPercent) + "%", forState: .Normal)
        
        if finalPercent == 100.0 {
            header.text = "Perfect!"
        } else if finalPercent >= 75 {
            header.text = "Almost There!"
        } else if finalPercent < 75 && finalPercent >= 50  {
            header.text = "Keep Trying!"
        } else if finalPercent < 50 && finalPercent >= 25  {
            header.text = "You can do better! Try again."
        } else {
            header.text = "Yikes, this is awkward..."
        }
        
        //header.text = String(finalPercent) + "%"
        scoreLabel.text = "You got " + String(score) + " of " + String(questions.count) + " correct."
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let vController = segue.destinationViewController as? ViewController {
            
            vController.quizzesAll = quizzesAll
            
        }
        
    }


}
