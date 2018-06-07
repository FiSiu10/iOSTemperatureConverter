//  This file holds the information for the cell prototype and prints out the units on the labels.
//  ConversionUnitTableViewCell.swift
//  TemperatureConverter
//
//  Created by Fiona Siu on 2018-02-14.
//  Copyright © 2018 Fiona Siu. All rights reserved.
//

import UIKit

class ConversionUnitTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var unitTitle: UILabel!
    
    //MARK: Delegate Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

