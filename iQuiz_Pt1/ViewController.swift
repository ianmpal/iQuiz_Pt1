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
    
    
    var quizzes = [("Mathematics", "Mathematics Quiz Subheading"), ("Marvel Super Heroes", "Super Heroes Subheading"), ("Science", "Science Subheading")]
    
    var mathQuestions = [("What is 2*2?", "9", "4", "3", "2", "9")]
    
    var heroQuestions = [("Who shoots webs out of his hands?", "Superman", "Batman", "Spiderman", "Loki", "Spiderman"), ("Who wears a red cape?", "Superman", "Batman", "Spiderman", "Loki", "Superman")]
    
    var scienceQuestions = [("What is the English name for the element Hg?", "Mercury", "Plutonium", "Helium", "Oxygen", "Mercury")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iQuiz"
        // Do any additional setup after loading the view, typically from a nib.

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
        
        
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        let (quizName, quizSubHeading) = quizzes[indexPath.row]
        cell.textLabel?.text = quizName
        cell.detailTextLabel?.text = quizSubHeading

        
        // Adding an image to "row" under the properties inspector appears to do the same thing as this code
        // Same with the chevron code
        
        //cell.imageView!.image = UIImage(named: "nyan_cat")
        
        //chevron code
        //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
    

//     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("hello")
//    
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("hello")
//    }

    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.selectedTitle = (cell?.textLabel?.text)!
        self.performSegueWithIdentifier("quiz", sender: nil)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
     
        if selectedTitle == "Mathematics" {
            if let qController = segue.destinationViewController as? QuizController {
                qController.questions = mathQuestions
            }
        }
        
        if selectedTitle == "Marvel Super Heroes" {
            if let qController = segue.destinationViewController as? QuizController {
                qController.questions = heroQuestions
            }
        }
        
        if selectedTitle == "Science" {
            if let qController = segue.destinationViewController as? QuizController {
                qController.questions = scienceQuestions
            }
        }
        
        
      }
    
 
    
    
    
    
    
    
}

// http://stackoverflow.com/questions/28323925/push-segue-from-uitableviewcell-to-viewcontroller-in-swift

