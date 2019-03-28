//
//  DeliveryAcceptViewController.swift
//  bossapp
//
//  Created by ANP on 3/27/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

class DeliveryDenyViewController: UIViewController {

    @IBOutlet weak var deliveryDenyCenterY: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        deliveryDenyCenterY.constant = 1000
    }
    
    @IBAction func dismiss(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //let ratio = (popupImageView.image?.size.width)! / popupImageView.frame.size.width
        
        //let calcHeight = (popupImageView.image?.size.height)! / ratio
        
        //popupImageHeight.constant = calcHeight
        
        deliveryDenyCenterY.constant = 0
    
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
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
