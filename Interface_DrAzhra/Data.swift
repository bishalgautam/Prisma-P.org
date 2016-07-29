//
//  Data.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 7/12/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

//import Cocoa
import UIKit

class Data: NSObject {
    
    var patientName: String?
    var accountId: String?
    var cat_30d: String?
    var cat_cv: String?
    var cat_icu: String?
    var cat_mv: Double?
    var pred_30d: Double?
    var pred_cv: Double?
    var pred_icu: Double?
    var pred_mv: Int?
    
    
    init(dictionary: NSDictionary) {
        
        patientName = dictionary["pname"] as? String
        accountId = dictionary["accountno"] as? String
        cat_30d = dictionary["cat_30d"] as? String
        cat_cv = dictionary["cat_cv"] as? String
        cat_icu = dictionary["cat_icu"] as? String
        cat_mv = dictionary["cat_mv"] as? Double
        pred_cv = dictionary["pred_cv"] as? Double
        pred_icu = dictionary["pred_icu"] as? Double
        pred_mv = dictionary["pred_mv"] as? Int
        
    }

}
