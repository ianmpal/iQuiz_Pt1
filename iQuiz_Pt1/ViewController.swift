//
//  ViewController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/2/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    var quizzes = [("Mathematics", "Mathematics quiz subheading"), ("Marvel Super Heroes", "Super Heroes subheading"), ("Science", "Science subheading")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iQuiz"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        //cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
    
    
    
    
    
    
    
}






















