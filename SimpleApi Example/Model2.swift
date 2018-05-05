//
//  Model2.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import Foundation


//{
//    "id": "c200",
//    "name": "Ravi Tamada",
//    "email": "ravi@gmail.com",
//    "address": "xx-xx-xxxx,x - street, x - country",
//    "gender" : "male",
//    "phone": {
//        "mobile": "+91 0000000000",
//        "home": "00 000000",
//        "office": "00 000000"
//    }



class Model2{
    
    var id :String?
    var name:String?
    var email: String?
    var mobile:String?
    
    
    
    init(dict:[String:AnyObject]) {
        
        
        if let id = dict["id"] as? String{
            
            self.id = id
        }
        if let name = dict["name"] as? String{
            
            self.name = name
        }
        if let email = dict["email"] as? String{
            
            self.email = email
            
        }
        if let phone = dict["phone"] as? [String:AnyObject]{
            if let mobile = phone["mobile"] as? String{
                
                self.mobile = mobile
                
            }
            
        }
        
    }
}
