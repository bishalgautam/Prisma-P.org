//
//  MainViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 6/9/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit
import ResearchKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

//    @IBAction func consentTapped(sender: AnyObject) {
//        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRunUUID: nil)
//        taskViewController.delegate = self
//        presentViewController(taskViewController, animated: true, completion: nil)
////        
////        dispatch_async(dispatch_get_main_queue(), { () -> Void in
////           self.presentViewController(taskViewController, animated: true, completion: nil)
////        })
//        
//    }
    @IBAction func onBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
       // self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBOutlet weak var UserEmailTextField: UILabel!
    
    var email = " "
    
//    @IBAction func getServerDataPressed(sender: AnyObject) {
//        
//        
//        
//    }
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    //logot button
    @IBAction func onLogout(sender: AnyObject) {
//        print(NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedin"))
        
        NSUserDefaults.standardUserDefaults().setBool(false,forKey: "isUserLoggedin")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print(NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedin"))
        
        let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("loginView") as! LoginViewController
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window!.rootViewController = loginView
        appDelegate.window!.makeKeyAndVisible()
        
       // print(NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedin"))
        
        
        
      //  self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        myPicker.delegate = self
//        myPicker.dataSource = self
        
        getdataServer()
//        UserEmailTextField.text = email

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    var AccountID = ["A1H44498","A1H46215","A1F42085","A1F40983","A1F40528", "A1H45041","A1H44957","A1H46214","A1F39105","A1F43620",]
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AccountID.count    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AccountID[row]
    }
    
    internal func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    func getdataServer(){
        
        let url : String = "http://deepc04.acis.ufl.edu:8081/PrismaWebService/rest/WebService/GetScores"
//        "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=Bihorac,Azra%5Bauthor%5D&retmode=json"
       
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            (data, response, error) in
            
            if (error != nil){
//                print("errors =\(error)")
                return
                
            }
            
            print("response = \(response)")
            print("data = \(data)")
            
            var json: Array<NSDictionary>!
            
//            do {
//                json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? Array
//            } catch {
//                print(error)
//            }
            
//            var json : NSDictionary?
            
            //    var json : NSDictionary = nil;
            
            do {
                if ((data) != nil){
//                    json = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as? NSDictionary
                    //.MutableContainers  //.AllowFragments
                  json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as? Array<NSDictionary>
                    
                    print("inside here")
                    print(json)
                }
            } catch (let e as NSError) {
                //here you can get access to all of the errors that occurred when trying to serialize
                print(e)
                print("Error serializing the data")
            }
            
//            if let item = json[0] as? NSDictionary;
//            let cat_30d = item["cat_30d"] as? [String: AnyObject];
////                let age = person["age"] as? Int else {
//                    return;
//            }
//            print("Dani's age is \(cat_30d)")
//
//
            if let parseJSON = json[0] as? NSDictionary {
                 print("inside string")
                if let cat = parseJSON["accountno"] as? String{
                    print(cat)
//                    print("inside string")
                }
                

               // print("parseJSON \(parseJSON)")
                
            }

        }
        
        task.resume()
        
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
//extension MainViewController : ORKTaskViewControllerDelegate {
//    
//    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
//        //Handle results with taskViewController.result
//        taskViewController.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//}


