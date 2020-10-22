//
//  stopWatchViewController.swift
//  ClockApp
//
//  Created by IT on 10/20/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class stopWatchViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    // MARK: Outlets
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dots: UILabel!
    // MARK: Variables
    var hours = 0
    var minutes = 0
    var seconds = 0
    var lappedTimes:[String] = []
    var timer = Timer()
    //var counter = 0.0
    //var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.isHidden = true
        dots.isHidden = true
        pauseButton.isHidden = true
//        titleLabel.text = "\(counter)"
//        playButton.isEnabled = true
//        pauseButton.isEnabled = true
//

        // Do any additional setup after loading the view.
    }
    
    // MARK: Methods of Stop Watch Functionality
    
    @IBAction func btnPausee(_ sender: UIButton) {
       // playButton.isHidden = false
                  timer.invalidate()
        
        
    }
    
    @IBAction func btnPlay(_ sender: UIButton) {
        playButton.isSelected = true
        
      //  playButton.isHidden = true
        
        //pauseButton.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
       
    }
    @objc func count(){
        seconds += 1
        if seconds == 60{
            minutes += 1
            seconds = 0
            
        }
        if minutes == 60{
            minutes = 0
            seconds = 0
            hours += 1
            titleLabel.isHidden = false
            dots.isHidden = false
        }
        if hours == 24{
            resetTimes()
        }
        secondLabel.text = "\(seconds)"
        minuteLabel.text = minutes == 0 ? "00": "\(minutes)"
        titleLabel.text = hours == 0 ? "00": "\(hours)"
        
    }
    
    @IBAction func btnLap(_ sender: UIButton) {
        let currentTime  = "\(hours):\(minutes):\(seconds)"
        lappedTimes.append(currentTime)
        let indexPath = IndexPath(row: lappedTimes.count-1, section: 0)
               tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func resetTimes(){
        
        hours = 0
        minutes = 0
        seconds = 0
        lappedTimes = []
        timer.invalidate()
        secondLabel.text = "0"
        minuteLabel.text = "0"
        titleLabel.text = "0"
        tableView.reloadData()
    }
    @IBAction func btnReset(_ sender: UIButton) {
        
       resetTimes()

    }
      // MARK: - TableView Delegates Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lappedTimes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
        cell.textLabel?.text = lappedTimes[indexPath.row]
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .lightGray
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
