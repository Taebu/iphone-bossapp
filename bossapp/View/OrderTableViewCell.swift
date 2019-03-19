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
   //     self.storeNameLabel.text = order.st_name
        self.storeNameLabel.text = "BBQ치킨 영등포점"
        
        self.orderDateLabel.text = "2018/06/29(화)"

        //self.orderTimeLabel.text = dateFormatting(string_date: "2019-01-03 09:31:12")

        self.orderTimeLabel.text =  "18:15"
        self.tradeIdLabel.text = "ASDFQW123456"
        self.customerAddressLabel.text = "서울특별시 영등포구 영등포동 618-496"
        //  self.orderButton.isSelected = true
        
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
