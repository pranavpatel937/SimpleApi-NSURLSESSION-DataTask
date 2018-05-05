//
//  Model.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

//[
//    {
//        "id": 1,
//        "name": "Leanne Graham",
//        "username": "Bret",
//        "email": "Sincere@april.biz",
//        "address": {
//            "street": "Kulas Light",
//            "suite": "Apt. 556",
//            "city": "Gwenborough",
//            "zipcode": "92998-3874",
//            "geo": {
//                "lat": "-37.3159",
//                "lng": "81.1496"
//            }
//        },
//        "phone": "1-770-736-8031 x56442",
//        "website": "hildegard.org",
//        "company": {
//            "name": "Romaguera-Crona",
//            "catchPhrase": "Multi-layered client-server neural-net",
//            "bs": "harness real-time e-markets"
//        }
//}

import Foundation

class Model  {
    var name:String?
    var username:String?
    var lat:String?
    var id:Int?
    var city:String?
    var lati:String?
    var long:String?
    var email:String?
    var bs:String?
    
    init(dict:[String:AnyObject]) {
      
        if let name = dict["name"] as? String
         {
        self.name = name
        }
        if let id = dict["id"] as? Int{
            
            self.id = id 
        }
        
        if let email = dict["email"] as? String{
            
            self.email = email
        }
        
        if let company = dict["company"] as? [String:AnyObject]{
            
            if let bs  = company["bs"] as? String{
                
                self.bs = bs
            }
        }
        if let address = dict["address"] as? [String:AnyObject]
        {
            if let city = address["city"] as? String
            {
            self.city = city
            }
            if let geo = address["geo"] as?[String:AnyObject]{
                
                if let lati = geo["lat"] as? String{
                    
                    self.lati = lati
                    
                }
                
                
                if let lng = geo["lng"] as? String{
                    
                    self.long = lng
                    
                }
            }
            
        }
        
    }
    
    
    
    
}



