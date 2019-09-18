//
//  FormTableViewController.swift
//  Exp
//
//  Created by Ernest Gaisie on 12/09/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    var status: Bool = true
    var selctedCell: Int = Int()
    var currencies: [Currency] = [Currency]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ExpandableCell"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Enable/Disable", style: .plain, target: self, action: #selector(handleEnableAndDisable))
        
        NotificationCenter.default.addObserver(self, selector: #selector(onCurrenciesReceivedNotification(notification:)), name: API.currenciesReceivedNotification, object: nil)
        
        API.sharedInstance.processCurrencies()
        
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            selctedCell = indexPath.row
    
            if indexPath.row == selctedCell{
                ExpandingCell.sharedInstance.cardCellStatus()
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    return ExpandingCell.sharedInstance.cardCellExpansion(initialHeight: 70, ExpandingHeight: 160, indexPath: indexPath.row, selectedCell: selctedCell)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currencies.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FormTableViewCell
        
        cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.contentView.backgroundColor = .clear
        
        if status == true{
         cell.isUserInteractionEnabled = true
        } else
        {
            cell.isUserInteractionEnabled = false
        }
        
        if let currency: Currency = currencies[indexPath.row]
        {
            cell.longName?.text = currency.name
            cell.shortName?.text = currency.shortName
            cell.buyingPrice?.text = currency.buyingPrice
            cell.sellingPrice?.text = currency.sellingPrice
        }
        
        return cell
    }
    
    @objc func handleEnableAndDisable(){

        let indexPath = IndexPath(row: 0, section: 0)
        if status == false {
            print("Attempting Disable")
             tableView.reloadRows(at: [indexPath], with: .right)
        } else{
            tableView.reloadRows(at: [indexPath], with: .left)
            print("enable")
        }
        status = !status
    }
    
    @objc func onCurrenciesReceivedNotification(notification: Notification){
        if let currencies: [Currency] = notification.object as? [Currency]
        {
            self.currencies = currencies
            self.tableView.reloadData()
        }
    }
    
   
}

