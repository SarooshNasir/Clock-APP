//
//  ViewController.swift
//  ClockApp
//
//  Created by IT on 10/20/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    let clock = Clock()
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: Methods
    @objc func updateTimeLabel(){
         let formatter = DateFormatter()
         formatter.timeStyle = .medium
         timeLabel.text = "\(formatter.string(from: clock.currentTime as Date))"
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimeLabel), name: UIApplication.willEnterForegroundNotification, object: nil)
       
        
        // Do any additional setup after loading the view.
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
 

}

