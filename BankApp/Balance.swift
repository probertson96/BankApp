//
//  Balance.swift
//  BankApp
//
//  Created by Patrick Robertson on 25/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import Foundation
import UIKit

class Balance {
    
    private var _totalMonthlyIncome: Double!
    private var _totalMonthlyExpense: Double!
    private var _netMonthlyGainLoss: Double!
    private var _currentBankBalance: Double!
    
    var totalMonthlyIncome: Double {
        return _totalMonthlyIncome
    }
    
    var totlaMonthlyExpense: Double {
        return _totalMonthlyExpense
    }
    
    var netMonthlyGainLoss: Double {
        return (_totalMonthlyIncome - _totalMonthlyExpense)
    }
    
    var currentBankBalance: Double {
        return _currentBankBalance
    }
    
    init(income: Double, expense: Double, netGainLoss: Double, balance: Double) {
        self._totalMonthlyIncome = income
        self._totalMonthlyExpense = expense
        self._netMonthlyGainLoss = netGainLoss
        self._currentBankBalance = balance
    }
    
    
}