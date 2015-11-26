//
//  DataServices.swift
//  BankApp
//
//  Created by Patrick Robertson on 25/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    internal(set) var _loadedPosts = [IncomeExpense]()
    
    internal(set) var _balance = 0.0
    
    internal(set) var _income = 0.0
    
    internal(set) var _expense = 0.0
    
    internal(set) var _netGainLoss = 0.0
    
    
    var loadedPosts: [IncomeExpense] {
        return _loadedPosts
    }
    
    var income: Double {
        return _income
    }
    
    var expense: Double {
        return _expense
    }
    
    var balance: Double {
        return _balance
    }
    
    var netGainLoss: Double {
        return _netGainLoss
    }
    
    func addIncomeExpensePost(post: IncomeExpense) {
        _loadedPosts.append(post)
    }
    
    
}
