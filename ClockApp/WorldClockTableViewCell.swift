//
//  WorldClockTableViewCell.swift
//  ClockApp
//
//  Created by IT on 10/23/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {
    // MARK: Labels
    @IBOutlet weak var timeZoneName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
    }
    @objc func setTime(){
        timeLabel.text = getTime()
    }
    func getTime() -> String{
        var timeString = ""
        
        if timeZoneName.text != "" {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.timeZone = TimeZone(identifier: timeZoneName.text!)
            let timeNow = Date()
            timeString = formatter.string(from: timeNow)
        }
        return timeString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
