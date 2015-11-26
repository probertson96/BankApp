//
//  IncomeExpenseCell.swift
//  BankApp
//
//  Created by Patrick Robertson on 24/11/2015.
//  Copyright © 2015 Patrick Robertson. All rights reserved.
//

import UIKit

class IncomeExpenseCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var incomeExpenseColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(post: IncomeExpense) {
        dateLabel.text = post.date
        descriptionLabel.text = post.reportDescription
        if post.type == "Income" {
            amountLabel.text = "+ $\(post.amount)"
            incomeExpenseColor.layer.backgroundColor = INCOME_CELL_COLOR.CGColor
        } else if post.type == "Expense" {
            amountLabel.text = "- $\(post.amount)"
            incomeExpenseColor.layer.backgroundColor = EXPENSE_CELL_COLOR.CGColor
        }
    }

}
