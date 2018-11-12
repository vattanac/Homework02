//
//  WelcomeViewController.swift
//  HwPro
//
//  Created by Vattanac on 11/12/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
   
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomLoginLabel: UIButton!
    var delegate:AccountDelegation!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomLoginLabel.layer.cornerRadius = 10
    }
    
    @IBAction func LogInOut(_ sender: Any) {
        
        guard let login = self.storyboard?.instantiateViewController(withIdentifier: "LoginStroryBoard") as? LoginViewController else {
            fatalError("No VC")
        }

        login.delegate = self
        navigationController?.pushViewController(login, animated: true)
    }
   
}

extension WelcomeViewController:AccountDelegation {
    func ThrowData(account: Account) {
        welcomeLabel.text = "welcom \(account.userName!)"
    }
    
    
}
