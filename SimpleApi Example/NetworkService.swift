//
//  NetworkService.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import Foundation
class NetworkService
{
    let url:String
    init(url:String) {
        
        self.url=url
        
    }
    typealias Datahandler =  ((NSData)->Void)
    func downloadData(completion: @escaping Datahandler)
    {
        
        
        let url = NSURL(string:self.url)
        
        let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
            
            
            
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
                                print("Error \(error?.localizedDescription)")
                            }
            
                        }
            
            
            
            
            
            
            
            
            
        }
        
        task.resume()
       
            

            
            
            
            
        
        
        
    }
}
extension NetworkService{
    
    static func parseJSONFromData(jsonData:NSData?) ->[[String:AnyObject]]?
    {
        
        if let data = jsonData{
            do{
                
                let jsonDictionary = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:AnyObject]]
                
                print(jsonDictionary)
                
                return jsonDictionary
                
                
            }catch let error as NSError{
                
                print("error /(error.localizedDescription)")
            }
            
        }
        return nil
    }
    
    static func parseJsonObject(jsonData:NSData?) ->[String:AnyObject]?
    {
        
        if let data = jsonData{
            do{
                
                let jsonDictionary = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
                
                print(jsonDictionary)
                
                return jsonDictionary
                
                
            }catch let error as NSError{
                
                print("error /(error.localizedDescription)")
            }
            
        }
        return nil
    }
}


