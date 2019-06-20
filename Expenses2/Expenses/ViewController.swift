//
//  ViewController.swift
//  Expenses
//
//  Created by Bl223LabCPU on 6/5/19.
//  Copyright © 2019 Bl223LabCPU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var expenses = [expense]()
    
    let dateConvertString = DateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //let dateConvertString = DateFormatter()
        dateConvertString.dateFormat = "MM, DD, yyyy HH:mm"

        //let dinnerDate = "June 1, 2018 18:30"
        if let dinnerDate = dateConvertString.date(from: "06, 01, 2018 18:30")
        {
        expenses.append(expense(title: "Dinner", amount: 32.50, date: dinnerDate))
        }
        
        if let OfficeDate = dateConvertString.date(from: "05, 30, 2018 12:17")
        {
            expenses.append(expense(title: "Office Supplies", amount: 59.34, date: OfficeDate))
        }
        
        if let UberDate = dateConvertString.date(from: "05, 30, 2018 11:43")
        {
            expenses.append(expense(title: "Uber", amount: 16.29, date: UberDate))
        }
        
        if let CoffeeDate = dateConvertString.date(from: "05, 29, 2018 8:45")
        {
            expenses.append(expense(title: "Coffee", amount: 3.95, date: CoffeeDate))
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpensesCell", for: indexPath)
    
        if let cell = cell as? ExpenseTableViewCell {
            
            let expense = expenses[indexPath.row]
            
            cell.titleLabel.text = expense.title
            cell.amount.text = String(expense.amount)
            cell.date.text = dateConvertString.string(from: expense.date)
            
        }
    
        return cell
    }
    
    
}

