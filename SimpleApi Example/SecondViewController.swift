//
//  SecondViewController.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var model2 = [Model2]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.dataSource = self
        tableview.delegate = self
      fetchData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return model2.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SecondTableViewCell
        
        if let id = model2[indexPath.row].id{
            
            cell.lbl_id.text = id
        }
        if let name = model2[indexPath.row].name{
            
            cell.lbl_name.text = name
        }
        if let email = model2[indexPath.row].email{
            
            cell.lbl_email.text = email
        }
        if let mobile = model2[indexPath.row].mobile{
            
            cell.lbl_mobile.text = mobile
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 174
    }
    func fetchData()
    {
        NetworkService(url:"https://api.androidhive.info/contacts/")
            .downloadData { (data) in
               
               let jsonobj = NetworkService.parseJsonObject(jsonData: data)
              
                if  let array = jsonobj!["contacts"] as? [[String:AnyObject]]
                {
                    for ele in array
                    {
                        let objEleme = Model2(dict: ele)
                        
                            
                        self.model2.append(objEleme)
                        
                    }
                    DispatchQueue.main.async {
                        
                        self.tableview.reloadData()
                    }
                    
                }
                
              
                
        }
        
    }
    
}
