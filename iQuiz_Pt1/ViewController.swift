//
//  ViewController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/2/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var selectedTitle : String = ""
    
    var quizzes = [NSDictionary]()
    var questions = [NSDictionary]()

    
    var realQuizzes = [String: [String]]()
    var indexOfSelection = 0
    
    
    @IBOutlet var quizTable: UITableView!
    
    @IBAction func onButtonPress(sender: AnyObject) {
        print(quizzes)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iQuiz"
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewWillAppear(animated: Bool) {
        self.quizTable.reloadData()
    }
    
    // return how many sections are in table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    // return int how many rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    
    @IBAction func settingsPressed(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Settings Go Here", message:
            "Subtitle here", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    // contents of each cell
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Row", forIndexPath: indexPath)
        
        let quizName = quizzes[indexPath.row]["title"]!
        let quizSubHeading = quizzes[indexPath.row]["desc"]!
        
        cell.textLabel?.text = String(quizName)
        cell.detailTextLabel?.text = String(quizSubHeading)
        
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        cell.tintColor = UIColor.whiteColor()
        return cell
    }
    


    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        indexOfSelection = indexPath.row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.selectedTitle = (cell?.textLabel?.text)!
        self.performSegueWithIdentifier("quiz", sender: nil)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        questions = quizzes[indexOfSelection]["questions"] as! [NSDictionary]
        
        print(questions)
       
     
            if let qController = segue.destinationViewController as? QuizController {
                qController.questions = quizzes[indexOfSelection]["questions"] as! [NSDictionary]
                qController.questionsLeft = quizzes.count
                qController.quizName = String(quizzes[indexOfSelection]["title"])
            }
        
      }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        print("moved back")
    }
    
    
}


/* Mock Data


var quizzes2 = [("Mathematics", "Mathematics Quiz Subheading"), ("Marvel Super Heroes", "Super Heroes Subheading"), ("Science", "Science Subheading")]

var mathQuestions = [("What is 2*2?", "9", "4", "3", "2", "4"), ("What is 50*3?", "6", "42", "108", "150", "150"), ("How many times does 3 go into 36?", "54", "12", "15", "10", "12"), ("What is the square root of 144?", "12", "11", "10", "9", "12"), ("What is 14%10", "6", "2", "3", "4", "4"), ("What is 2*36?", "67", "76", "75", "72", "72")]

var heroQuestions = [("Who shoots webs out of his hands?", "Superman", "Batman", "Spiderman", "Loki", "Spiderman"), ("Who wears a red cape?", "Superman", "Batman", "Spiderman", "Loki", "Superman"), ("Who is Thor's brother?", "Superman", "Batman", "Spiderman", "Loki", "Loki"), ("Who's parents were killed by a robber?", "Batman", "The Joker", "Penguin", "Mr. Freeze", "Batman")]

var scienceQuestions = [("What is the English name for the element Hg?", "Mercury", "Plutonium", "Helium", "Oxygen", "Mercury"), ("What does water turn into when it freezes?", "It's still a liquid", "Magma", "Vapor", "Ice", "Ice")]

*/