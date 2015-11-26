//
//  MaterialTableCell.swift
//  BankApp
//
//  Created by Patrick Robertson on 26/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit

class MaterialTableCell: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(5.0, 2.0)
    }

}
