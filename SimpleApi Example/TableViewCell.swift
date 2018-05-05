//
//  TableViewCell.swift
//  SimpleApi Example
//
//  Created by Pranav Patel on 5/5/18.
//  Copyright © 2018 Pranav Patel. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    
   
    @IBOutlet weak var lbl_bs: UILabel!
    @IBOutlet weak var lbl_long: UILabel!
    @IBOutlet weak var lbl_lat: UILabel!
    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_username: UILabel!
    
    @IBOutlet weak var lbl_id: UILabel!
    
    @IBOutlet weak var lbl_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
