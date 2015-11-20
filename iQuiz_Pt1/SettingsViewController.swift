//
//  SettingsViewController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/17/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var quizzes = [NSDictionary]()
    
    @IBAction func unwindSegue(sender: AnyObject) {
    }
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func downloadQuiz(sender: AnyObject) {
        
        let newURL = self.urlTextField.text
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let url = NSURL(string: newURL!)
                
        let request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "GET"
        
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            print("URL Task Worked: \(statusCode)")
            
            do {
                self.quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [NSDictionary]
                
                
                
            } catch {
                let alertController = UIAlertController(title: "BAD URL", message:
                    "", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        
        task.resume()
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //print(quizzes)
        
        
        if let vController = segue.destinationViewController as? ViewController {
            vController.quizzes = quizzes
        }
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.urlTextField.text = "http://tednewardsandbox.site44.com/questions.json"


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
