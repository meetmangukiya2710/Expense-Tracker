//
//  DeleteViewController.swift
//  Expense Tracker
//
//  Created by R95 on 12/07/24.
//

import UIKit

class DeleteViewController: UIViewController {
    
    @IBOutlet weak var editBtnAction: UIButton!
    @IBOutlet weak var deleteBtnAction: UIButton!
    @IBOutlet weak var categorylable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var notesLable: UILabel!
    @IBOutlet weak var typelable: UILabel!
    
    var catogorytext = ""
    var pricetext = 0
    var datetext = Date()
    var notestext = ""
    var typetext = ""
    var MtClassObj = MoneyTrackerCoreDataClass()
    var count = 0
    var value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        
        categorylable.text = catogorytext
        priceLable.text = "₹\(pricetext)/-"
        dateLable.text = "\(datetext)"
        notesLable.text = notestext
        typelable.text = typetext
    }
    
    func design() {
        editBtnAction.layer.cornerRadius = 10
        deleteBtnAction.layer.cornerRadius = 10
    }
    
    
    @IBAction func deleteBynAction(_ sender: Any) {
        alertFunc()
    }
}

extension DeleteViewController {
    func alertFunc() {
        let a = UIAlertController(title: "Delete ␡", message: "Amount Succefully Remove", preferredStyle: .alert)
        
        a.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
            MtClassObj.deleteData(money: pricetext)
            for i in array {
                if i.money == pricetext {
                    value = count
                    break
                }
                count += 1
            }
            array.remove(at: value)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                navigationController?.popViewController(animated: true)
            }
        }))
        
        present(a, animated: true)
    }
}
