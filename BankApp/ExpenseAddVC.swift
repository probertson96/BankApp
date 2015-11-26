//
//  ExpenseVC.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit

class ExpenseAddVC: UIViewController {
    
    @IBOutlet weak var expenseDatePicker: UIDatePicker!
    @IBOutlet weak var expenseAmountTextField: UITextField!
    @IBOutlet weak var expenseDescriptionTextField: UITextField!
    
    var date: String!
    var expenseDate: String!
    var expenseType = "Expense"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       expenseDatePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    
    }

    
    @IBAction func expenseAddButtonPressed(sender: AnyObject) {
        
        if DATA_KEY._balance > 0 {
        
        if date == nil {
            
            let currentDate = NSDate()
            let formatter = NSDateFormatter()
            
            formatter.dateFormat = "EE dd"
            date = formatter.stringFromDate(currentDate)
            
        }
        
        if let newExpenseDescription = expenseDescriptionTextField.text, let newExpenseAmount = Double(expenseAmountTextField.text!) {
            
            
            let post = IncomeExpense(type: expenseType, date: date, reportDescription: newExpenseDescription, amount: newExpenseAmount)
            DataService.instance.addIncomeExpensePost(post)
            let expense = loopThroughExpense()
            DataService.instance._expense += expense
            DATA_KEY._balance -= expense
            
        }
            
        } else if DATA_KEY._balance <= 0 {
             
        }
    }
    
    
    func datePickerChanged(datePicker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EE dd"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        date = strDate
    }
    
    func loopThroughExpense() -> Double {
        var expense = 0.0
        var expenseArray = [IncomeExpense]()
        
        for post in DataService.instance._loadedPosts {
            if post.type == "Expense" {
                expenseArray.append(post)
            }
        }
        
        for amount in expenseArray {
            expense += amount.amount
        }
        
        expenseArray.removeAll()
        
        return expense
    }
    

}
