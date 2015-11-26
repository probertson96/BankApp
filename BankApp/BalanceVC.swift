//
//  SecondViewController.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit



class BalanceVC: UIViewController {
    
    @IBOutlet weak var currentBankBalanceLabel: UILabel!
    @IBOutlet weak var totalMonthlyIncomeLabel: UILabel!
    @IBOutlet weak var totalMonthlyExpenseLabel: UILabel!
    @IBOutlet weak var netMonthlyGainLossLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initaliseUI()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        initaliseUI()

    }
    
    func initaliseUI() {
        
        let convertedBalance = currencyFormatter(DATA_KEY._balance)
        let convertedIncome = currencyFormatter(DATA_KEY._income)
        let convertedExpense = currencyFormatter(DATA_KEY._expense)
        
        let netGainLoss = calculateNetLossGain(DATA_KEY._income, expense: DATA_KEY._expense)
        let convertedNetGainLoss = currencyFormatter(netGainLoss)
        
        currentBankBalanceLabel.text = convertedBalance
        totalMonthlyIncomeLabel.text = convertedIncome
        totalMonthlyExpenseLabel.text = convertedExpense
        netMonthlyGainLossLabel.text = convertedNetGainLoss
        
        if netGainLoss > 0 {
            netMonthlyGainLossLabel.textColor = INCOME_CELL_COLOR
        } else if netGainLoss < 0 {
            netMonthlyGainLossLabel.textColor = EXPENSE_CELL_COLOR
        }
        
    }
    
    
    func calculateNetLossGain(income: Double, expense: Double) -> Double {
        let netGainLoss = income - expense
        return netGainLoss
    }
    
    func currencyFormatter(value: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        return formatter.stringFromNumber(value)!
    }


}

