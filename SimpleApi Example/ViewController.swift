//
//  ViewController.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var model = [Model]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        tableview.delegate = self
        tableview.dataSource = self
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
    
    func fetchData()
    {
        NetworkService(url:"https://jsonplaceholder.typicode.com/users")
            .downloadData { (data) in
             
         let array  = NetworkService.parseJSONFromData(jsonData: data)
          
         if let myArray = array
         {
            
           for element in myArray
           {
            
            let ele = Model(dict: element)
            
            self.model.append(ele)
           }
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
            
            
         }
                
                
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if let name = model[indexPath.row].name
        {
        cell.lbl_name.text = name
        }
        if let id = model[indexPath.row].id{
            
            cell.lbl_id.text = String(id)
        }
        if let city = model[indexPath.row].city{
            
            cell.lbl_city.text = city
        }
        if let email = model[indexPath.row].email{
            
            cell.lbl_email.text = email
        }
        
        if let lati = model[indexPath.row].lati{
            
            cell.lbl_lat.text = lati
        }
        if let lng = model[indexPath.row].long{
            
            cell.lbl_long.text = lng
        }
        if let bs = model[indexPath.row].bs{
            cell.lbl_bs.text = bs
        }
        
       return cell
    }
    
}

