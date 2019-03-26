//
//  OrderViewController.swift
//  bossapp
//
//  Created by ANP on 3/15/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

class OrderPayCell: UITableViewCell{
    
    @IBOutlet weak var menuName: UILabel!
    
    
    @IBOutlet weak var menuPrice: UILabel!
    
    @IBOutlet weak var menuContents: UILabel!
    
}

class OrderAddressCell: UITableViewCell{
    
    @IBOutlet weak var orderAddressTitle: UILabel!
    @IBOutlet weak var orderAddressDetail: UILabel!
    
}
class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var orderPayCellHeight: NSLayoutConstraint!
    /*
    var menuNameData:NSMutableArray = ["세트 4(양념+마늘간장) 1개", "주문금액","배달팁","총 결제금액"]
    var menuPriceData:NSMutableArray = ["24,000원", "24,000원","2,000원","26,000원"]
    
    var orderNameArrayData:NSMutableArray = ["""
    - 추가선택: 음료사이즈 1.25 추가(1,000원)
    - 기본:23,000원
    ""","","",""]
    */
    var menuNameData:NSMutableArray = ["사전결제여부", "배달금액","맛집배달팁","총 결제금액"]
    var menuPriceData:NSMutableArray = ["Y", "2,000원","2,000원","26,000원"]
    
    var orderNameArrayData:NSMutableArray = ["","","",""]
    
    
    var menuNameData2:NSMutableArray = ["연락처", "배달주소"]
    var menuPriceData2:NSMutableArray = ["050-1234-1234", "서울특별시 영등포구 .."]
    
    var orderNameArrayData2:NSMutableArray = ["","","",""]
    
    // MARK: - Properties
    var thumbnailImage: UIImage?
    
    @IBOutlet weak var orderPayTableView: UITableView!
    
    @IBOutlet weak var orderAddressTableView: UITableView!
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet var fullStarButton: UIBarButtonItem!
    @IBOutlet var emptyStarButton: UIBarButtonItem!
    
    // MARK: Stored Properties
    var order: Order! {
        didSet {
            self.navigationItem.title = "order.name"
            self.correctBarButtonState()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



/// 코드블록 9-5-2

// MARK: - Button States
extension OrderViewController {
    
    private func correctBarButtonState() {
        self.navigationItem.rightBarButtonItems = nil
        
        let bottomBarButtonItem: UIBarButtonItem
        
//        if Person.bestFriends.contains(self.order) {
        if true {
//            bottomBarButtonItem = self.fullStarButton
        } else {
//            bottomBarButtonItem = self.emptyStarButton
        }
        
 //       self.navigationItem.rightBarButtonItems = [bottomBarButtonItem]
    }
}
///


/// 코드블록 9-5-3

// MARK: - IBActions
extension OrderViewController {
    
    @IBAction func touchUpFullStarButton(_ sender: UIBarButtonItem) {
        Order.setOrder(self.order) { (isSuccess: Bool) in
            if isSuccess {
                self.correctBarButtonState()
            }
        }
    }
    
    @IBAction func touchUpEmptyStarButton(_ sender: UIBarButtonItem) {
        Order.setOrder(self.order) { (isSuccess: Bool) in
            if isSuccess {
                self.correctBarButtonState()
            }
        }
    }
}
///


/// 코드블록 9-5-4

// MARK: - Life Cycle
extension OrderViewController {
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let order: Order = self.order else {
            return
        }
        
        self.correctBarButtonState()
        
        self.storeName.text = order.st_name
        self.cellLabel.text = order.insdate
        //self.orderTime.text = order.insdate
       // self.imageView.image = self.thumbnailImage ?? placeHolderImage
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        orderPayTableView.estimatedRowHeight = 100
        orderPayTableView.rowHeight = UITableView.automaticDimension
//        orderPayCellHeight.constant = orderPayTableView.contentSize.height
        
       // orderAddressTableView.estimatedRowHeight = 100
       // orderAddressTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == orderPayTableView {
                return orderNameArrayData.count
        }else{
                return menuNameData2.count
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell:UITableViewCell
        
        if tableView == orderPayTableView
        {

        let cell = orderPayTableView.dequeueReusableCell(withIdentifier: "orderPayCell", for: indexPath) as! OrderPayCell
        
        if(orderNameArrayData[indexPath.row % orderNameArrayData.count] as? String == "")
        {
            if(cell.menuContents != nil){
                cell.menuContents.removeFromSuperview()
                
            }
            
        }else{
            cell.menuContents.text = orderNameArrayData[indexPath.row % orderNameArrayData.count] as? String
            
        }
        
        cell.menuName.text =  menuNameData[indexPath.row % menuNameData.count] as? String
        cell.menuPrice.text =  menuPriceData[indexPath.row % menuPriceData.count] as? String
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        self.view.layoutIfNeeded()
        
            defaultCell = cell
        }else{
        
            let cell = orderAddressTableView.dequeueReusableCell(withIdentifier: "orderAddressCell", for: indexPath) as! OrderAddressCell
            
                cell.orderAddressTitle.text = menuNameData2[indexPath.row % menuNameData2.count] as? String
                
            
            
            cell.orderAddressTitle.text =  menuNameData2[indexPath.row % menuNameData2.count] as? String
            cell.orderAddressDetail.text =  menuPriceData2[indexPath.row % menuPriceData2.count] as? String
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            self.view.layoutIfNeeded()
            
            defaultCell = cell
        }
        return defaultCell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if order == nil {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
///

