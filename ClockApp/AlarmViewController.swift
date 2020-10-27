//
//  AlarmViewController.swift
//  ClockApp
//
//  Created by IT on 10/27/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource ,AlarmClockProtocol {
    
    
    
    var alarmdata :[String] = []
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func addAlarmTimmings(time: String) {
        alarmdata.append(time)
        tblView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alarmdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmcell", for: indexPath) as! AlarmTableViewCell
        
        // cell.?.text = alarmdata[indexPath.row]
        //cell.alarmLabel.text = alarmdata[indexPath.row]
        cell.alarmLabel.text = alarmdata[indexPath.row]
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


