//
//  NetworkServicePost.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import Foundation

class NetworkServicePost
{
    let url:String
    init(url:String) {
        
        self.url=url
        
    }
    typealias Datahandler =  ((NSData)->Void)

    func getPostData(dict:[String:String],completion: @escaping Datahandler)
    {
        
        let request = NSMutableURLRequest(url: NSURL(string:url)! as URL)
        let session = URLSession.shared
        request.httpMethod = "POST"
        
        var jsonData:Data?
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dict as? Dictionary<String,String>!, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        request.httpBody = jsonData!
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
          
            
            if error == nil
            {
                
                if let httpResponse = response as? HTTPURLResponse
                {
                    
                    switch (httpResponse.statusCode)
                    {
                    case 200:
                        
                        if let data = data{
                            
                            completion(data as NSData)
                        }
                    default:
                        print(httpResponse.statusCode)
                        
                    }
                    
                    
                }
                else
                {
                    print("Error \(String(describing: error?.localizedDescription))")
                }
                
            }
            
            
            
        })
        
        task.resume()


    }
    
    
}



