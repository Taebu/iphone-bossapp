//
//  HomeViewController.swift
//  bossapp
//
//  Created by ANP on 4/5/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var storeName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        storeName.text = UserDefaults.standard.string( forKey: "st_name")
    }
    
    @IBAction func logout(_ sender: Any) {

        UserDefaults.standard.set(false, forKey: "isAutoLogin")
        
        var loginVC : UIViewController?
        loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginVC
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
