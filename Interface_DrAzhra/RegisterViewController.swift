//
//  RegisterViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 6/9/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBAction func onAlreadyHaveAccount(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onRegister(sender: AnyObject) {
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        
        //check for empty form
        
    if(userName!.isEmpty || userPassword!.isEmpty || repeatPassword!.isEmpty){
        
        displayAlertMessage("All Fields Required")
        
         return
        }
        // check for same password
        
        if(userPassword != repeatPassword){
            displayAlertMessage("Passwords do not match")
            return
        }
        
        //store the data 
        
        let myUrl = NSURL(string: "http://localhost:8888/phpiOS/userRegister.php")
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
            var messageToDisplay : String?
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
                
                var resultValue = parseJSON["status"] as? String
                
                print("result: \(resultValue)")
                
                var isUserRegistered: Bool = false;
                
                if(resultValue == "Success"){ isUserRegistered = true}
                
                  messageToDisplay = parseJSON["message"] as! String
                
                if(!isUserRegistered){
                  messageToDisplay  = parseJSON["message"] as! String
                    
                }
            }

            
            
                dispatch_async(dispatch_get_main_queue(),{
                    
                       // display confirmation message
                    
            let myAlert = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: UIAlertControllerStyle.Alert)
                    
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion: nil) }
                    
            myAlert.addAction(okAction)
                
            self.presentViewController(myAlert, animated: true, completion: nil)
                        
                        
            })
                    
                    
        }

        task.resume()
}
    
    func displayAlertMessage(userMessage : String){
        
        let myAlert = UIAlertController(title: "ALert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
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
