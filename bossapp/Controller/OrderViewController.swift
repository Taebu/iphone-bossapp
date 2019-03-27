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

class OrderMenuCell: UITableViewCell{
    
    @IBOutlet weak var orderMenuTitle: UILabel!
    @IBOutlet weak var orderMenuPrice: UILabel!
    @IBOutlet weak var orderMenuContent: UILabel!
}

class OrderInfoCell: UITableViewCell{
    
    @IBOutlet weak var orderInfoTitle: UILabel!
    
    @IBOutlet weak var orderInfoDetail: UILabel!
}

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var orderPayCellHeight: NSLayoutConstraint!

    var menuNameData:NSMutableArray = ["사전결제여부", "배달금액","맛집배달팁","총 결제금액"]
    var menuPriceData:NSMutableArray = ["Y", "2,000원","2,000원","26,000원"]
    
    var orderNameArrayData:NSMutableArray = ["","","",""]
    
    
    var menuNameData2:NSMutableArray = ["연락처", "배달주소"]
    var menuPriceData2:NSMutableArray = ["050-1234-1234", """
서울특별시 영등포구 양평동
서울에스라교회
"""]
    
    var orderNameArrayData2:NSMutableArray = ["","","",""]

    
     var menuNameData3:NSMutableArray = ["세트 4(양념+마늘간장) 1개", "주문금액","배달팁","총 결제금액"]
     var menuPriceData3:NSMutableArray = ["24,000원", "24,000원","2,000원","26,000원"]
     
     var menuContentData3:NSMutableArray = ["""
     - 추가선택: 음료사이즈 1.25 추가(1,000원)
     - 기본:23,000원
     ""","","",""]
    
    
    var menuTitleData:NSMutableArray = ["주문업소", "주문시간","접수시간","배달시간","주문번호","주문금액","할인금액","배달금액","맛집배달팁"]
    var menuDetailData:NSMutableArray = ["BBQ치킨 영등포본점", "06/26(화) 11:27","06/26(화) 11:27","40분 내 배달","ASDF123456","56,000원","0","2,000원","2,000원"]
    
    
    // MARK: - Properties
    var thumbnailImage: UIImage?
    
    @IBOutlet weak var orderPayTableView: UITableView!
    
    @IBOutlet weak var orderAddressTableView: UITableView!
    
    @IBOutlet weak var orderMenuTableView: UITableView!
    @IBOutlet weak var orderInfoTableView: UITableView!
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet var fullStarButton: UIBarButtonItem!
    @IBOutlet var emptyStarButton: UIBarButtonItem!
    
    
    @IBOutlet weak var orderPayHeight: NSLayoutConstraint!
    @IBOutlet weak var orderAddressHeight: NSLayoutConstraint!
    @IBOutlet weak var orderMenuHeight: NSLayoutConstraint!
    @IBOutlet weak var orderInfoHeight: NSLayoutConstraint!
    
    
    // MARK: Stored Properties
    var order: Order! {
        didSet {
           // self.navigationItem.title = "order.name"
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
        
        orderAddressTableView.estimatedRowHeight = 100
        orderAddressTableView.rowHeight = UITableView.automaticDimension
        
        orderMenuTableView.estimatedRowHeight = 400
        orderMenuTableView.rowHeight = UITableView.automaticDimension
        
        orderInfoTableView.estimatedRowHeight = 100
        orderInfoTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return CGFloat(388.0)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == orderPayTableView {
                return menuNameData.count
            
        }else if tableView == orderAddressTableView{
            return menuNameData2.count

        }else  if tableView == orderMenuTableView{
            return menuNameData3.count
        }else{
            return menuTitleData.count
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
        
            self.tableViewDidChange(orderPayTableView)
            defaultCell = cell
        }else if tableView == orderAddressTableView{
        
            let cell = orderAddressTableView.dequeueReusableCell(withIdentifier: "orderAddressCell", for: indexPath) as! OrderAddressCell
            
                cell.orderAddressTitle.text = menuNameData2[indexPath.row % menuNameData2.count] as? String
                
            
            
            cell.orderAddressTitle.text =  menuNameData2[indexPath.row % menuNameData2.count] as? String
            cell.orderAddressDetail.text =  menuPriceData2[indexPath.row % menuPriceData2.count] as? String
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            self.tableViewDidChange(orderAddressTableView)
            self.view.layoutIfNeeded()
            
            defaultCell = cell
        }else  if tableView == orderMenuTableView{
            
            let cell = orderMenuTableView.dequeueReusableCell(withIdentifier: "orderMenuCell", for: indexPath) as! OrderMenuCell
            cell.orderMenuTitle.text =  menuNameData3[indexPath.row % menuNameData3.count] as? String
            cell.orderMenuPrice.text =  menuPriceData3[indexPath.row % menuPriceData3.count] as? String
        
            if(menuContentData3[indexPath.row % menuContentData3.count] as? String == "")
            {
                if(cell.orderMenuContent != nil){
                    cell.orderMenuContent.removeFromSuperview()
                    
                }
                
            }else{
                if cell.orderMenuContent != nil {
                    cell.orderMenuContent.text = menuContentData3[indexPath.row % menuContentData3.count] as? String
                }
            }
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            self.view.layoutIfNeeded()
            orderMenuTableView.rowHeight = UITableView.automaticDimension
            self.tableViewDidChange(orderMenuTableView)
            defaultCell = cell
        }else{
            
            let cell = orderInfoTableView.dequeueReusableCell(withIdentifier: "orderInfoCell", for: indexPath) as! OrderInfoCell
            cell.orderInfoTitle.text =  menuTitleData[indexPath.row % menuTitleData.count] as? String
            cell.orderInfoDetail.text =  menuDetailData[indexPath.row % menuDetailData.count] as? String
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            defaultCell = cell
            
            self.tableViewDidChange(orderInfoTableView)
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


extension OrderViewController {
    func tableViewDidChange(_ tableView:UITableView){
        if tableView == orderMenuTableView {
            print("orderInfo table view Height \(tableView.contentSize.height)")
            orderMenuHeight.constant = tableView.contentSize.height
            orderMenuHeight.constant = 220.0
        }else if tableView == orderPayTableView {
            print("order Pay table view Height \(tableView.rowHeight)")
            orderPayHeight.constant = tableView.contentSize.height
            orderPayHeight.constant = 180.0
        }else if tableView == orderAddressTableView {
            print("orderAddress table view Height \(tableView.contentSize.height)")
            orderAddressHeight.constant = tableView.contentSize.height
            orderAddressHeight.constant = 90.0
        }else{
            print("orderInfoTable view Height \(tableView.contentSize.height)")
            orderInfoHeight.constant = tableView.contentSize.height
            orderInfoHeight.constant = 400.0
        }
        
        self.view.layoutIfNeeded()
    }
}
