//
//  ViewController.swift
//  Expense Tracker
//
//  Created by R95 on 11/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var ExpenseView: UIView!
    @IBOutlet weak var incomeTotalTxt: UILabel!
    @IBOutlet weak var expenceTotalTxt: UILabel!
    @IBOutlet weak var totalRsLableOutlet: UILabel!
    
    var incomeTotal: Int = 0
    var expenceTotal: Int = 0
    var totalRs: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        MTClassObj.getData()
        navigationItem.hidesBackButton = true
        tableViewOutlet.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        incomeExpenceSum()
        tableViewOutlet.reloadData()
    }
    
    func design() {
        headerView.layer.cornerRadius = 20
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        incomeView.layer.cornerRadius = 20
        ExpenseView.layer.cornerRadius = 20
        
    }
    
    func incomeExpenceSum() {
        for i in array {
            if "Income" == i.type {
                incomeTotal = incomeTotal + i.money
            }
            if "Expence" == i.type {
                expenceTotal = expenceTotal + i.money
            }
            totalRs = incomeTotal - expenceTotal
        }
        incomeTotalTxt.text = "₹\(incomeTotal)/-"
        expenceTotalTxt.text = "₹\(expenceTotal)/-"
        totalRsLableOutlet.text = "₹\(totalRs)/-"
        incomeTotal = 0
        expenceTotal = 0
        totalRs = 0
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionTableViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: array[indexPath.row].date)
        
        cell.categoryLable.text = array[indexPath.row].category
        cell.pricelable.text = "₹\(array[indexPath.row].money)/-"
        cell.typeLable.text = array[indexPath.row].type
        cell.datelable.text = dateString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = storyboard?.instantiateViewController(identifier: "DeleteViewController") as! DeleteViewController
        
        var indexPath = array[indexPath.row]
        
        select.catogorytext = indexPath.category
        select.datetext = indexPath.date
        select.notestext = indexPath.detail
        select.pricetext = indexPath.money
        select.typetext = indexPath.type
        
        navigationController?.pushViewController(select, animated: true)
    }
}
