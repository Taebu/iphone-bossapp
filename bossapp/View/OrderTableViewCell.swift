//
//  OrderTableViewCell.swift
//  bossapp
//
//  Created by ANP on 3/11/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

protocol OrderTableViewCellDelegate{
    func orderCellStateChanged(_ sender: OrderTableViewCell)
}

class OrderTableViewCell: UITableViewCell {
    
    var delegate: OrderTableViewCellDelegate?
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var customerAddressLabel: UILabel!
    @IBOutlet weak var orderTimeLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var tradeIdLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func touchUpStateOrderButton(_ sender: UIButton){
        if let delegate = self.delegate{
            delegate.orderCellStateChanged(self)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension OrderTableViewCell{
    func configure(order:Order,tableView:UITableView,indexPath:IndexPath){
        self.storeNameLabel.text = order.st_name
        self.orderDateLabel.text = order.insdate
        self.orderTimeLabel.text = dateFormatting(string_date: order.insdate)
        self.tradeIdLabel.text = order.Tradeid
        self.orderButton.isSelected = true
        
    }
    
    func dateFormatting(string_date:String ) -> String {
        var date = Date()
        let dateFormatter = DateFormatter()
        date = dateFormatter.date(from: string_date)!
        
        dateFormatter.dateFormat = "HH:mm:ss"//"EE" to get short style
        let mydt = dateFormatter.string(from: date).capitalized
        
        return "\(mydt)"
    }
}
