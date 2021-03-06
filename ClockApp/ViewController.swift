//
//  ViewController.swift
//  ClockApp
//
//  Created by IT on 10/20/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate , worldClockProtocol {
    
    // MARK: Outlet for tableView
    @IBOutlet weak var tblView: UITableView!
    // MARK: Variables
    var timer = Timer()
    var timeZonesToDisplay: [String] = []
    // MARK: Protocol Method
    func addTimeZone(timeZone: String) {
        timeZonesToDisplay.append(timeZone)
        tblView.reloadData()
        //setting user default
        setUserDefaults()

    }
    
    // MARK: WorldClock Work
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeZonesToDisplay.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldClockTableViewCell
        cell.timeZoneName.text = timeZonesToDisplay[indexPath.row]
        //cell.timeZoneName.lineBreakMode = .byClipping
        //cell.timeLabel.lineBreakMode = .byClipping
        return cell
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            timeZonesToDisplay.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
            setUserDefaults()
        }
    }
    
    
    // MARK: cell display Style
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .secondarySystemBackground
    }
    
    // MARK: Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modelViewSegue"{
            let destination = segue.destination as! TimeZonesTableViewController
            destination.delegate = self
            
        }
    }
    
    // MARK: User Defaults
    func setUserDefaults(){
        UserDefaults.standard.set(timeZonesToDisplay, forKey: "WorldClocks")
        UserDefaults.standard.synchronize()
    }
    func getUserDefaults() -> [String]{
        if (UserDefaults.standard.value(forKey: "WorldClocks") != nil){
            timeZonesToDisplay = UserDefaults.standard.value(forKey: "WorldClocks") as! [String]
        }
        return timeZonesToDisplay
    }
    
    
    
    
    
    
    
    // MARK: Simple Clock work
    // MARK: Outlets
    let clock = Clock()
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: Methods
    @objc func updateTimeLabel(){
         let formatter = DateFormatter()
        formatter.timeStyle = .short
         timeLabel.text = "\(formatter.string(from: clock.currentTime as Date))"
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
        timeZonesToDisplay = getUserDefaults()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        NotificationCenter.default.addObserver(self, selector: #selector(updateTimeLabel), name: UIApplication.willEnterForegroundNotification, object: nil)
        timer  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
       
        
        // Do any additional setup after loading the view.
    }
    deinit {
        //NotificationCenter.default.removeObserver(self)
        timer.invalidate()
    }
 

}

