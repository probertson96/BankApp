//
//  IncomeVC.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit

class IncomeAddVC: UIViewController {
    
    
    @IBOutlet weak var incomeDatePicker: UIDatePicker!
    @IBOutlet weak var incomeAmountTextField: UITextField!
    @IBOutlet weak var incomeDescriptionTextField: UITextField!
    
    var date: String!
    var incomeType = "Income"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      incomeDatePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)

    }


    @IBAction func addButtonPressed(sender: AnyObject) {
        
        if date == nil {
            
            let currentDate = NSDate()
            let formatter = NSDateFormatter()
            
            formatter.dateFormat = "EE dd"
            date = formatter.stringFromDate(currentDate)
            
        }
        
        
        if let newIncomeDescription = incomeDescriptionTextField.text, let newIncomeAmount = Double(incomeAmountTextField.text!) {
            
            let post = IncomeExpense(type: incomeType, date: date, reportDescription: newIncomeDescription, amount: newIncomeAmount)
            DataService.instance.addIncomeExpensePost(post)
            let income = loopThroughIncome()
            DataService.instance._income += income
            DATA_KEY._balance += income
            
            
        }

    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func datePickerChanged(datePicker: UIDatePicker) {
        datePicker.maximumDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EE dd"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        date = strDate
    }
    
    func loopThroughIncome() -> Double {
        var income = 0.0
        var incomeArray = [IncomeExpense]()
        
        for post in DataService.instance._loadedPosts {
            if post.type == "Income" {
                incomeArray.append(post)
            }
        }
        
        for amount in incomeArray {
            income += amount.amount
        }
        
        incomeArray.removeAll()
        
        return income
    }
    

    
}
