//
//  WelcomeViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 7/6/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit
import ResearchKit

class WelcomeViewController: UIViewController{
    
    
    
    @IBAction func surveyTapped(sender: AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask(), taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    @IBAction func consentTapped(sender: AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
//        
//        if (reason != .Failed) {
//            taskViewController.dismissViewControllerAnimated(true, completion: nil)
//        }
//    }
    
//    @IBAction func consentTapped(sender: AnyObject) {
//        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRunUUID: nil)
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
//        
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

extension WelcomeViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        //Handle results with taskViewController.result
        if (reason != .Failed) {
            taskViewController.dismissViewControllerAnimated(true, completion: nil)
        }

    }
    
}

