//
//  TransactionTableViewCell.swift
//  Expense Tracker
//
//  Created by R95 on 11/07/24.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var pricelable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet weak var datelable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
