//
//  AlarmTableViewCell.swift
//  ClockApp
//
//  Created by IT on 10/27/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit



class AlarmTableViewCell: UITableViewCell {

    
    @IBOutlet weak var alarmLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
