//
//  SubmitViewController.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 7/7/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController {

    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    
    @IBAction func valueChanged(sender: AnyObject) {
        let currentValue =
        Int(mySlider.value)
        if(currentValue <= 50){
         sliderValue.textColor = UIColor.greenColor()
        }else {
            sliderValue.textColor = UIColor.redColor()
        }
        
        sliderValue.text = "\(currentValue)%"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
