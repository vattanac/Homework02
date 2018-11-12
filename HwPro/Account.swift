//
//  Account.swift
//  HwPro
//
//  Created by Vattanac on 11/12/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import Foundation

class Account{
    var userName:String!
    var password:String!
    
    init(userName:String? , password:String){
        
        self.userName = userName
        self.password = password
    }
    
    var UserName:String?{
        get{
            return userName
    
        }
        set{
            userName = newValue
        }
    }
    var Password:String?{
        get{
           return password
        }
        set{
            password = newValue
        }
    }
    
}
