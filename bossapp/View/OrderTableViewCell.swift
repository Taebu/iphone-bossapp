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
        self.storeNameLabel.text = order.st_name
        self.orderDateLabel.text = dateFormatting(order.insdate)


        
        //self.orderTimeLabel.text =  order.insdate
        self.orderTimeLabel.text = timeFormatting(order.insdate)

        self.tradeIdLabel.text = order.Tradeid
        self.customerAddressLabel.text = """
        \(order.mb_addr1)
        \(order.mb_addr2)
        """
        //  self.orderButton.isSelected = true
        
    }
    
    func timeFormatting(_ date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var dateString = ""
        if let date = dateFormatterGet.date(from: date) {
            dateString = dateFormatter.string(from: date)
        } else {
            dateString = "There was an error decoding the string"
        }
        return dateString
    }
    
    
    func dateFormatting(_ date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var dateString = ""
        if let date = dateFormatterGet.date(from: date) {
             dateString = dateFormatter.string(from: date)
        } else {
           dateString = "There was an error decoding the string"
        }
        return dateString
    }
}

