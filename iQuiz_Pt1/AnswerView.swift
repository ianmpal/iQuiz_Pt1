//
//  AnswerView.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/9/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class AnswerView: UIViewController {
    
    var questions = [(String, String, String, String, String, Int)]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(questions)

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
