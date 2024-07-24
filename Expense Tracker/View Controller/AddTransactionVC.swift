//
//  AddTransactionVC.swift
//  Expense Tracker
//
//  Created by R95 on 11/07/24.
//

import UIKit

class AddTransactionVC: UIViewController {
    
    @IBOutlet weak var amountTxtOutlet: UITextField!
    @IBOutlet weak var categoryTxtOutlet: UITextField!
    @IBOutlet weak var noteTxtOutlet: UITextField!
    @IBOutlet weak var incomeBtnAction: UIButton!
    @IBOutlet weak var expenceBtnAction: UIButton!
    
    var MTClassObj = MoneyTrackerCoreDataClass()
    var viewVar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    
    @IBAction func incomeBtnAction(_ sender: Any) {
        if amountTxtOutlet.text == "" && categoryTxtOutlet.text == "" && noteTxtOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Deatils")
        }
        else if amountTxtOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Amount")
        }
        else if categoryTxtOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Categorys")
        }
        else {
            alertIncome()
        }
    }
    
    @IBAction func expenceBtnAction(_ sender: Any) {
        if amountTxtOutlet.text == "" && categoryTxtOutlet.text == "" && noteTxtOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Deatils")
        }
        else if amountTxtOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Amount")
        }
        else if categoryTxtOutlet.text == "" {
            alert(title: "Error!", message: "Enter the Categorys")
        }
        else {
            alertExpence()
        }
    }
    
    func design() {
        incomeBtnAction.layer.cornerRadius = 10
        expenceBtnAction.layer.cornerRadius = 10
    }
}

extension AddTransactionVC {
    func alertIncome() {
        let a = UIAlertController(title: "Income", message: "Add Amount in Income section", preferredStyle: UIAlertController.Style.alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] i in
            let strToInt = Int(amountTxtOutlet.text ?? "00") ?? 00
            
            MTClassObj.addData(money: strToInt, type: "Income", detail: noteTxtOutlet.text ?? "", date: Date.now, category: categoryTxtOutlet.text ?? "")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                removeText()
            }
        }))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        present(a, animated: true)
    }
    
    func alertExpence() {
        let a = UIAlertController(title: "Remove Expence", message: "Remove Amount in Expence section", preferredStyle: UIAlertController.Style.alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] i in
            let strToInt = Int(amountTxtOutlet.text ?? "00") ?? 00
            
            MTClassObj.addData(money: strToInt, type: "Expence", detail: noteTxtOutlet.text ?? "", date: Date.now, category: categoryTxtOutlet.text ?? "")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [self] in
               removeText()
            }
        }))
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        present(a, animated: true)
    }
    
    func alert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "Ok", style: .default))
    }
}

extension AddTransactionVC {
    func removeText() {
        noteTxtOutlet.text = ""
        categoryTxtOutlet.text = ""
        amountTxtOutlet.text = ""
    }
}
