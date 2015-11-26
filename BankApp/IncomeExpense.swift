//
//  IncomeExpense.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import Foundation
import UIKit

class IncomeExpense {
    
    private var _type: String!
    private var _date: String!
    private var _reportDescription: String!
    private var _amount: Double!
    
    var type: String {
        return _type
    }
    
    var date: String {
        return _date
    }
    
    var reportDescription: String {
        return _reportDescription
    }
    
    var amount: Double {
        return _amount
    }
    
    init (type: String, date: String, reportDescription: String, amount: Double) {
        self._type = type
        self._date = date
        self._reportDescription = reportDescription
        self._amount = amount
    }
    
}