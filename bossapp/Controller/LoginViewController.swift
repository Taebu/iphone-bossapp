//
//  LoginViewController.swift
//  bossapp
//
//  Created by ANP on 3/29/19.
//  Copyright © 2019 ANPR. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var mb_id: UITextField!
    @IBOutlet weak var mb_password: UITextField!
    
    @IBOutlet weak var login_button: UIButton!
    
    @IBAction func pushLoginButton(_ sender: Any) {
        
        if(login_button.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginDone()
        }
        let mb_id = self.mb_id.text
        let mb_password = self.mb_password.text
        
        if mb_id=="" || mb_password == ""
        {
            return
        }
        
        DoLogin(mb_id!, mb_password!)
        
    }
    
    func DoLogin(_ user:String, _ password:String)
    {
        print(user + " : " + password)
        let url = URL(string:"https://img.cashq.co.kr/api/login/get_auth.php")
        
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let paramToSend = "mb_id=\(user)&mb_password=\(password)"
        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            
            guard let _:Data = data else
            {
                return
                
            }
            
            let json:Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json : ")
                print(json)
            }
            catch
            {
                print("network fail")
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                
                //print(server_response)
//                print(server_response["request"])
                return
                
            }
            print("server_response : ")
            print("test : \(server_response["response"]),,,")
            if let unwrapped = server_response["success"] {
                if unwrapped as? Int == 1
                {
                    DispatchQueue.main.async(execute: {
                        // work Needs to be done
                        let mainTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
                            mainTabBarController.selectedViewController = mainTabBarController.viewControllers?[2]
                        self.present(mainTabBarController, animated: true, completion: nil)
                    })
/*
                    var loginVC : UIViewController?
      
                    var mainTabBarVC : UIViewController?
                    
                        
                    mainTabBarVC?.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
 
 loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
 
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = loginVC
 */
 /*
                     
                     */
                    /*
                    let homeVc = self.storeyboard?.instantiateViewController(withIdentifier:"loginVC") as! LoginViewController
                    self.navigationController?.pushViewController(homeVc, animated: true)
 */
                }else{
                    print("login fail")

                }
                print("unwrap bool: \(unwrapped),,,")
               // Toast.show(message: "로그인 실패", OrderViewController)
              
            }
            if let data_block = server_response["data"] as? NSDictionary
            {
                print(data_block)
                if let session_data = data_block["session"] as? String
                {
                    print("session ?")
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    
                    DispatchQueue.main.async(execute: self.LoginDone)
                    
                }
            }
            
        })
        
        task.resume()
        
    }
    
    func LoginDone()
    {
        mb_id.isEnabled = false
        mb_password.isEnabled = false
        
        login_button.setTitle("Logout", for: .normal)
    }
    
    func LoginToDo()
    {
       // mb_id.isEnabled = true
       // mb_password.isEnabled = true
        
        //login_button.setTitle("Login", for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let preferences = UserDefaults.standard
        
        if(preferences.object(forKey: "session") != nil)
        {
            LoginDone()
        }
        else
        {
            LoginToDo()
            
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
