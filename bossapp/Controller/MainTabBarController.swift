//
//  MainTabBarController.swift
//  bossapp
//
//  Created by ANP on 3/11/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import Foundation
import UIKit
<<<<<<< HEAD
import UserNotifications
=======
>>>>>>> ca74339373deaa0e4e179d1f28cb5c95a7cf8c02

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

<<<<<<< HEAD
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.body = "Body"
        content.sound = UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "order_new.wav"))
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5 , repeats: false)
        
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
=======
>>>>>>> ca74339373deaa0e4e179d1f28cb5c95a7cf8c02
        // Do any additional setup after loading the view.
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
