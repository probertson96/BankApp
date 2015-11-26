//
//  MaterialView.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 5.0)
        
    }

}
