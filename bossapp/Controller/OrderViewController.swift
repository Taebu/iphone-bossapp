//
//  OrderViewController.swift
//  bossapp
//
//  Created by ANP on 3/15/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - Properties
    var thumbnailImage: UIImage?
    
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
            self.navigationItem.title = order.st_name.uppercased()
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
            bottomBarButtonItem = self.fullStarButton
        } else {
            bottomBarButtonItem = self.emptyStarButton
        }
        
        self.navigationItem.rightBarButtonItems = [bottomBarButtonItem]
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
        //self.cellLabel.text = order.address_name
        //self.orderTime.text = order.insdate
       // self.imageView.image = self.thumbnailImage ?? placeHolderImage
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if order == nil {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
///


