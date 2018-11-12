//
//  LoginViewController.swift
//  HwPro
//
//  Created by Vattanac on 11/12/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,AccountDelegation {
    var list = [Account]()
    func ThrowData(account: Account) {
        list.append(account)
        print("dfsdfs")
        
    }
    
    var throwelcome:String?
    var delegate:AccountDelegation?
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var signupbtnLabel: UIButton!
    @IBOutlet weak var LoginbtnLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupbtnLabel.layer.cornerRadius = 10
        LoginbtnLabel.layer.cornerRadius = 10
    }
    
  
    
    
    
    @IBAction func LoginButton(_ sender: Any) {
        for person in list{
            if(person.userName == usernameTextField.text && person.password == passwordTextField.text){
               
                    throwelcome = usernameTextField.text!
                    delegate?.ThrowData(account: Account(userName: throwelcome, password: ""))
                    navigationController?.popViewController(animated: true)
                    
                
            }else{
                  displayMessage(msg: "Please Check your Input again ")
            }
        }
    }
    
    func displayMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        guard let signup = self.storyboard?.instantiateViewController(withIdentifier: "SignUpStoryBoard") as? SignUpViewController else {
            fatalError("No VC")
        }
        
        signup.delegate = self
        
        navigationController?.pushViewController(signup, animated: true)
    }
}
