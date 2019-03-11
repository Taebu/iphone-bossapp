//
//  ShowSplashScreen.swift
//  bossapp
//
//  Created by ANP on 3/11/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //performSelector(onMainThread: Selector("mainTabBarController"), with: nil, waitUntilDone: true)
        
        perform(#selector(showNaviController), with: nil, afterDelay: 3)
    }
    
    @objc func showNaviController()
    {
        performSegue(withIdentifier: "showSplashScreen", sender: self)
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
