//
//  AddAlarmViewController.swift
//  ClockApp
//
//  Created by IT on 10/27/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit
import UserNotifications

protocol AlarmClockProtocol{
    func addAlarmTimmings(time : String)
}
class AddAlarmViewController: UIViewController{

    var delegate : AlarmClockProtocol?
    @IBOutlet weak var datePicker: UIDatePicker!
    let datePickerObject = UIDatePicker()
    var datePickerData :[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent() 
        content.title = "Alarm"
        content.sound = UNNotificationSound.default

        let dateComponent = datePicker.calendar.dateComponents([.day, .hour, .minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)

        let notificationReq = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(notificationReq, withCompletionHandler: nil)
    }
//    @IBAction func btn_Save(_ sender: Any) {
//        scheduleNotification()
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        formatter.dateStyle = .none
//        formatter.dateFormat = "h:mm a"
//        datePicker.datePickerMode = UIDatePicker.Mode.time
//        let date = formatter.string(from: datePicker.date)
//        delegate?.addAlarmTimmings(time: date)
//        print(date)
//        self.view.endEditing(true)
//        self.dismiss(animated: true, completion: nil)
//        
//    }
    
    @IBAction func btn_save(_ sender: UIBarButtonItem) {
               scheduleNotification()
               let formatter = DateFormatter()
               formatter.timeStyle = .medium
               formatter.dateStyle = .none
               formatter.dateFormat = "hh:mm a"
               datePicker.datePickerMode = UIDatePicker.Mode.time
               print(datePicker.date)
               let date = formatter.string(from: datePicker.date)
               delegate?.addAlarmTimmings(time: date)
               print(date)
               self.view.endEditing(true)
               self.dismiss(animated: true, completion: nil)
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
