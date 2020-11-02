//
//  AlarmViewController.swift
//  ClockApp
//
//  Created by IT on 10/27/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource ,AlarmClockProtocol{
    
    var date: String?
    var datePicker: UIDatePicker?
    
    
    var alarmdata :[String] = []
    var selectedDate : UIDatePicker?
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        if let cdate = date {
          alarmdata.insert(cdate, at: 0)
        }
        selectedDate = datePicker
        tblView.reloadData()
        

        
        // Do any additional setup after loading the view.
    }
    func addAlarmTimmings(time: String , dateP :UIDatePicker) {
        tblView.reloadData()
        alarmdata.insert(time, at: 0)
        selectedDate = dateP
        tblView.reloadData()
    }
//    func addBedTimmings(time: String, dateP: UIDatePicker) {
//        tblView.reloadData()
//        alarmdata.insert(time, at: 0)
//        print(time , dateP)
//        selectedDate = dateP
//        tblView.reloadData()
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alarmdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmcell", for: indexPath) as! AlarmTableViewCell
        
        // cell.?.text = alarmdata[indexPath.row]
        //cell.alarmLabel.text = alarmdata[indexPath.row]
        cell.alarmLabel.text = alarmdata[indexPath.row]
        cell.alarmSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
        cell.alarmSwitch.addTarget(self, action: #selector(presentNotification), for: UIControl.Event.valueChanged)

        print(alarmdata)
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .darkGray
    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 82
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "alarmSegue"{
            let destination = segue.destination as! AddAlarmViewController
            destination.delegate = self
        }
//        else if (segue.identifier == "BedAlarmSegue"){
//        let alarmViewController = segue.destination as! BedTimeViewController
//            alarmViewController.delegate = self
//
//        }
        
    }
    
    @objc func presentNotification() {
        if let selected = selectedDate{
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .none
            formatter.dateFormat = "MMM d, h:mm a"
            let date = formatter.string(from: selected.date)
            let content = UNMutableNotificationContent()
            content.title = "Alarm Schedule"
            content.sound = UNNotificationSound.default
            content.body = date
            let dateComponent = selected.calendar.dateComponents([.day, .hour, .minute], from:selected.date)
                   print(dateComponent)
                   let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
                    let uuidString = UUID().uuidString
                    let notificationReq = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
                    UNUserNotificationCenter.current().add(notificationReq,
                           withCompletionHandler: { (error) in
                               
                       })
            
        }

    }
}

//func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       if segue.identifier == "alarmSegue"{
//           let destination = segue.destination as! AddAlarmViewController
//           destination.delegate = self
//
//       }
//   }

//func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//          if segue.identifier == "alarmSegue"{
//              let destination = segue.destination as! AddAlarmViewController
//            destination.delegate = self
//
//          }
//      }

//func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "alarmSegue"{
//        let destination = segue.destination as! AddAlarmViewController
//        destination.delegate = self
//
//    }
//}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the elected object to the new view controller.
 }
 */


