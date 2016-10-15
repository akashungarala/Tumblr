//
//  Cell.swift
//  Tumblr
//
//  Created by Akash Ungarala on 10/12/16.
//  Copyright © 2016 Akash Ungarala. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var photo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutMargins = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}