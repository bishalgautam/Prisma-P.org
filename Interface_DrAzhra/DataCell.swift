//
//  DataCell.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 7/7/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var AccountID: UILabel!
    @IBOutlet weak var cat_30TextField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
