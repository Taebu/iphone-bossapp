//
//  OrderProcessingTableViewController.swift
//  bossapp
//
//  Created by ANP on 3/8/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit


/// 코드블록 9-6-1

class OrderProcessingTableViewController: UITableViewController {
    
    // MARK: - Properties
    // MARK: Privates
    private var orders: [Order] = []
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        indicator.backgroundColor = UIColor.lightGray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
}
///


/// 코드블록 9-6-2

// MARK: - Friend Table View Cell Delegate

extension OrderProcessingTableViewController: OrderTableViewCellDelegate {
    
    func orderCellStateChanged(_ sender: OrderTableViewCell) {
        guard let index: IndexPath =
            self.tableView.indexPath(for: sender) else {
                return
        }
        
        guard index.row < self.orders.count else { return }
        
        let order: Order = self.orders[index.row]
        if sender.orderButton.isSelected {
            Order.setOrder(order)
        } else {
            Order.setOrder(order)
        }
    }
}

///


/// 코드블록 9-6-3

// MARK: - Table view data source
extension OrderProcessingTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return self.orders.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell",
                                                 for: indexPath) as! OrderTableViewCell
        cell.delegate = self as OrderTableViewCellDelegate
        
        guard indexPath.row < self.orders.count else {
            return cell
        }
        
        let order: Order = self.orders[indexPath.row]
        
        // Configure the cell...
        cell.configure(order: order, tableView: tableView, indexPath: indexPath)
        return cell
    }
}
///


/// 코드블록 9-6-4

// MARK: - Table view delegate
extension OrderProcessingTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell: UITableViewCell = tableView.cellForRow(at: indexPath) {
            self.performSegue(withIdentifier: "showOrderInfo", sender: cell)
        }
    }
}
///


/// 코드블록 9-6-5

// MARK: - Activity Indicator
extension OrderProcessingTableViewController {
    
    private func showActivityIndicator() {
        self.view.addSubview(self.indicator)
        
        let safeAreaLayoutGuide: UILayoutGuide = self.view.safeAreaLayoutGuide
        
        self.indicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        indicator.startAnimating()
    }
    
    private func hideActivityIndicator() {
        
        self.indicator.stopAnimating()
        self.indicator.removeFromSuperview()
    }
}
///


/// 코드블록 9-6-6

// MARK: - Request 친구 목록 가져오기
extension OrderProcessingTableViewController {
    
    @objc private func requestOrders() {
        
        if let isRefreshing: Bool = self.tableView.refreshControl?.isRefreshing,
            isRefreshing == false {
            self.showActivityIndicator()
        }
        
        Request.orders(order_status: "processing") { (orders: [Order]?) in
            if let orders = orders {
                self.orders = orders
                self.tableView.reloadSections(IndexSet(0...0),
                                              with: UITableView.RowAnimation.automatic)
                
            }
            /* 새로고침 */
            if let refreshControl: UIRefreshControl = self.tableView.refreshControl,
                refreshControl.isRefreshing == true {
                refreshControl.endRefreshing()
            } else {
                self.hideActivityIndicator()
            }
        }
    }
}
///


/// 코드블록 9-6-7

// MARK: - Life Cycle
extension OrderProcessingTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* FriendTableViewCell.xib custom table load and init
         let cellNib: UINib = UINib.init(nibName: "OrderTableViewCell",
         bundle: nil)
         
         self.tableView.register(cellNib,
         forCellReuseIdentifier: "orderCell")
         */
        let refreshControl: UIRefreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.requestOrders),for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.blue
        
        
        self.tableView.refreshControl = refreshControl
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.orders.isEmpty {
            self.requestOrders()
        } else {
            self.tableView.reloadSections(IndexSet(0...0),
                                          with: UITableView.RowAnimation.none)
        }
    }
}
///


/// 코드블록 9-6-8

// MARK: - Navigation
extension OrderProcessingTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showOrderInfo" else { return }
        
        guard let cell: OrderTableViewCell = sender as? OrderTableViewCell else {
            return
        }
        
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        guard index.row < self.orders.count else { return }
        
        guard let orderViewController: OrderViewController =
            segue.destination as? OrderViewController else {
                return
        }
        
        let order: Order = self.orders[index.row]
        orderViewController.order = order
        
        // orderViewController.thumbnailImage = cell.profileImageView.image
    }
}
///


