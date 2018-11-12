//
//  SignUpViewController.swift
//  HwPro
//
//  Created by Vattanac on 11/12/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,AccountDelegation, UITextFieldDelegate {
    func ThrowData(account: Account) {
        print("Hello")
    }
    
    @IBOutlet weak var SignUpLabel: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate:AccountDelegation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            SignUpLabel.layer.cornerRadius = 10
        
    }

    func displayMessage(msg:String){
        let myAlert = UIAlertController(title: "Alert", message: msg, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    func ValidateUserName() -> Bool {
        let username = usernameTextField.text!
        let regex = "[A-Za-z]+"
        let valid = NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: username)
        return valid
    }

    @IBAction func SignUpButton(_ sender: Any) {
        
        
        delegate?.ThrowData(account: Account(userName: usernameTextField.text!, password: passwordTextField.text!))
        
        if(usernameTextField.text!.isEmpty || passwordTextField.text!.isEmpty || confirmPasswordTextField.text!.isEmpty){
            
            displayMessage(msg: "Please Input value!!")
            return
        }
        if(passwordTextField.text! != confirmPasswordTextField.text!){
            displayMessage(msg: "Password Not much!")
            confirmPasswordTextField.text = ""
            confirmPasswordTextField.becomeFirstResponder()
            return
        }
        if !ValidateUserName(){
            print(ValidateUserName())
            displayMessage(msg: "Please Input String User's Name!")
        }else{
            
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
}
