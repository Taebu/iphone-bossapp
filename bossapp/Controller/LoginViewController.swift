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
    
    @IBOutlet weak var autoLoginSwitch: UISwitch!

    var isAutoLogin = false
    @objc func switchChanged(mySwitch: UISwitch) {
        isAutoLogin = mySwitch.isOn
        
        UserDefaults.standard.set(isAutoLogin, forKey: "isAutoLogin")
        
        print("this switch value : \(isAutoLogin)")
        
        // Do something
    }
    
    
 
    @IBAction func pushLoginButton(_ sender: Any) {
        
        if !CheckInternet.Connection(){
            
            //self.Alert(Message: "Connected")
            //self.Alert(Message: "Your Device is not connected with internet")
            self.Alert(Message: "인터넷이 연결 되지 않았습니다. 연결상태를 확인해주세요.")
            return
        }
        
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
                
                self.Alert(Message: "network fail.")
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
                    
                    UserDefaults.standard.set(server_response["st_name"], forKey: "st_name")
                    
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
                    
                    UserDefaults.standard.set(user, forKey: "mb_id")
                    UserDefaults.standard.set(password, forKey: "mb_password")
                }else{
                    print("login fail")
                    //self.Alert(Message: "로그인에 실패하였습니다. \n 비밀번호를 확인해 주세요.")
                    return

                }
                print("unwrap bool: \(unwrapped),,,")
               // Toast.show(message: "로그인 실패", OrderViewController)
              
            }
            /*
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
 */
            
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
        
        autoLoginSwitch.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
        
        if UserDefaults.standard.bool(forKey: "isAutoLogin") {
            
            let mb_id = UserDefaults.standard.string(forKey: "mb_id")
            let mb_password = UserDefaults.standard.string(forKey: "mb_password")
            print ("mb_id : \(mb_id) , \(mb_password)")
            if mb_id != nil && mb_password != nil
            {
            DoLogin(mb_id!, mb_password!)
            }
        }
        
        mb_id.text = UserDefaults.standard.string(forKey: "mb_id")
        mb_password.text = UserDefaults.standard.string(forKey: "mb_password")
        autoLoginSwitch.isOn = UserDefaults.standard.bool(forKey: "isAutoLogin")
        
        let token = UserDefaults.standard.string(forKey: "token")
        let scode = UserDefaults.standard.string(forKey: "mb_id")
        
        setToken(scode!, token!)
        
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            print("uuid : ")
            
            print(uuid)

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
    

    func Alert (Message: String){
    
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func setToken(_ user:String, _ token:String)
    {
        print(user + " : " + token)
        let url = URL(string:"https://img.cashq.co.kr/api/token/set_token.php")
        
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let paramToSend = "scode=\(user)&ti_token=\(token)"
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
                
                self.Alert(Message: "network fail.")
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
                    
                    UserDefaults.standard.set(server_response["st_name"], forKey: "st_name")
                    
                    UserDefaults.standard.set(user, forKey: "mb_id")
                    UserDefaults.standard.set(token, forKey: "token")
                }else{
                    print("login fail")
                    //self.Alert(Message: "로그인에 실패하였습니다. \n 비밀번호를 확인해 주세요.")
                    return
                    
                }
                print("unwrap bool: \(unwrapped),,,")
                // Toast.show(message: "로그인 실패", OrderViewController)
                
            }
            
        })
        
        task.resume()
        
    }
}
