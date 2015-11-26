//
//  FirstViewController.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit


class IncomeExpenseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var incomeExpenseTableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        incomeExpenseTableView.delegate = self
        incomeExpenseTableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        incomeExpenseTableView.reloadData()
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("IncomeExpenseCell") as? IncomeExpenseCell {
            
            cell.configureCell(post)
            return cell
            
        } else {
            let cell = IncomeExpenseCell()
            cell.configureCell(post)
            return cell
        }
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notif: AnyObject) {
        incomeExpenseTableView.reloadData()
    }


}

