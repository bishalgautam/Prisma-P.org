//
//  TableViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 7/7/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBAction func onLogOut(sender: AnyObject) {
         print(NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedin"))
        
        NSUserDefaults.standardUserDefaults().setBool(false,forKey: "isUserLoggedin")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print(NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedin"))
        
        let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("loginView") as! LoginViewController
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window!.rootViewController = loginView
        appDelegate.window!.makeKeyAndVisible()

    }
    
    @IBOutlet weak var tableView: UITableView!
    var result: Array<NSDictionary>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        getServerData()
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.estimatedRowHeight = 220.0
//        tableView.rowHeight = UITableViewAutomaticDimension
//
        
        let url : String = "http://deepc04.acis.ufl.edu:8081/PrismaWebService/rest/WebService/GetScores"
        //        "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=Bihorac,Azra%5Bauthor%5D&retmode=json"
        
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
                                                                      completionHandler: { (dataOrNil, response, error) in
        if (error != nil){
             print("errors =\(error)")
            return
                                                                            
                }
                                                                        
        NSLog("response = \(response)")
                 
        if let data = dataOrNil {
            if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                                    data, options:[]) as? Array<NSDictionary> {
                    NSLog("response: \(responseDictionary)")
                                                                                
                    self.result = responseDictionary
                    self.tableView.reloadData()
                                                                            }
                                                                        }
                                                                        
        });
        
        task.resume()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCell", forIndexPath: indexPath) as! DataCell
        print(indexPath.row)
        //            print(json.count)
        //
        if let parseJSON = result![indexPath.row] as? NSDictionary {
            
            //            print("inside string")
            let accountno = parseJSON["accountno"] as? String
            let cat30 = parseJSON["cat_30d"] as? String
            
            cell.cat_30TextField.text = cat30
            cell.AccountID.text = accountno
           
            
        }
               return cell
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if let results = result{
            return results.count
        }
        else {
            return 0
        }
        
    }
    
    // Default is 1 if not implemented
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}