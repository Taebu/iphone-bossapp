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
        
    }
}
