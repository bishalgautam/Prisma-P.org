//
//  ViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 6/8/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "UF")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        
        //check for empty form
        
        if(userName!.isEmpty || userPassword!.isEmpty ){
            
            displayAlertMessage("All Fields Required")
            
            return
        }
        
        //store the data
        
        let myUrl = NSURL(string: "http://localhost:8888/phpiOS/userLogin.php")
        let request = NSMutableURLRequest(URL: myUrl!)
        request.HTTPMethod = "POST"
        let postString = "email=\(userName)&password=\(userPassword)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        print("username : \(userName) password :\(userPassword) ")
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            (data, response, error) in
            
            if (error != nil){
                print("errors =\(error)")
                return
                
            }
            
            print("response = \(response)")
            
            // var err: ErrorType?
//            var messageToDisplay : String?
            var json : NSDictionary?
            
            //    var json : NSDictionary = nil;
            
            do {
                if ((data) != nil){
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments ) as? NSDictionary
                    //.MutableContainers
                }
            } catch (let e as NSError) {
                //here you can get access to all of the errors that occurred when trying to serialize
                print(e)
                print("Error serializing the data")
            }
            
            //               var json = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
            
            if let parseJSON = json {
                
                print("parseJSON \(parseJSON)")
                
                let resultValue = parseJSON["status"] as? String
                
                print("result: \(resultValue)")
                
                if(resultValue == "Success"){
                    
                    //login successfull 
                    
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedin")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    NSOperationQueue.mainQueue().addOperationWithBlock {
//                        self.performSegue("onLoginSuccess")
                   
                    self.performSegueWithIdentifier("onLoginSuccess", sender: self)
                    }
                }
                
//                var isUserLoggedin: Bool = false;
//                
//                if(resultValue == "Success"){ isUserLoggedin = true}
//                
//                messageToDisplay = parseJSON["message"] as! String
//
//                if(!isUserLoggedin){
//                    messageToDisplay  = parseJSON["message"] as! String
//                    
//                }
            }
            
            
            
//            dispatch_async(dispatch_get_main_queue(),{
//                
//                // display confirmation message
//                
//                let myAlert = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: UIAlertControllerStyle.Alert)
//                
//                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
//                    self.dismissViewControllerAnimated(true, completion: nil) }
//                
//                myAlert.addAction(okAction)
//                
//                self.presentViewController(myAlert, animated: true, completion: nil)
//                
//                
//            })
            
            
        }
        
        task.resume()

        
        
        
    }
    
    
    func displayAlertMessage(userMessage : String){
        
        let myAlert = UIAlertController(title: "ALert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    // calling a segue from inside a closure
    
   
    func performSegue(identifier:String){
        self.performSegueWithIdentifier(identifier, sender: self)
    }

    
    
     // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //      Get the new view controller using segue.destinationViewController.
        //      Pass the selected object to the new view controller.
        if segue.identifier == "onLoginSuccess" {
            if let destinationVC = segue.destinationViewController as? MainViewController {
                destinationVC.email = userNameTextField.text!
            }
            
            
        }
    }


}

