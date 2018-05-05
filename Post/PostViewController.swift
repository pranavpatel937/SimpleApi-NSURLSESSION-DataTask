//
//  PostViewController.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData()
    {
        let dict = [
            "team_code":"Priyam03"
        ]
        
        NetworkServicePost(url: "http://180.211.99.165/rs/taskchat/api/team_members_list").getPostData(dict: dict)
        { (data) in
            
          NetworkService.parseJsonObject(jsonData: data)
            
        }
    }
}
