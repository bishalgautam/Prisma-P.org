//
//  MainViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 6/9/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var UserEmailTextField: UILabel!
    
    var email = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserEmailTextField.text = email

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
