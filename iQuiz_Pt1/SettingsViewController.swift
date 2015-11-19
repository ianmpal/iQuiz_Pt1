//
//  SettingsViewController.swift
//  iQuiz_Pt1
//
//  Created by Ian Palmgren on 11/17/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func downloadQuiz(sender: AnyObject) {
        
        //let didFinishExpectation = expectationWithDescription("download Finished")
        
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let url = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "GET"
        
        var quizzes = [AnyObject]()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            print("URL Task Worked: \(statusCode)")
            
            do {
                quizzes = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                
                //didFinishExpectation.fulfill
                
            } catch {
                //report error if it doesn't work
            }
            
            
            
            
        }
        
        task.resume()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
