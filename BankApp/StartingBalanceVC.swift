//
//  StartingBalanceVC.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit

class StartingBalanceVC: UIViewController {

    @IBOutlet weak var startingBalanceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func acceptButtonPressed(sender: AnyObject) {
        
        if let newBalance = Double(startingBalanceTextField.text!) {
            
            DATA_KEY._balance = newBalance
            
            print(newBalance)
            
            DataService.instance._income = 0.0
            
            DataService.instance._expense = 0.0
            
            DataService.instance._loadedPosts.removeAll()
        
            dismissViewControllerAnimated(true, completion: nil)
            
            }
        
    }
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
