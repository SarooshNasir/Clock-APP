//
//  BedTimeViewController.swift
//  ClockApp
//
//  Created by IT on 10/29/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

protocol BedTimeProtocol{
    
    func addBedTimmings(time : String , dateP :UIDatePicker)
}
class BedTimeViewController: UIViewController {
    // MARK: Outlets
    
    @IBOutlet weak var bedTimeDatePicker: UIDatePicker!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    // MARK: Delegate
    var delegate : BedTimeProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        bedTimeDatePicker.setValue(UIColor(red: 154, green: 123, blue: 2, alpha: 0.5), forKeyPath: "textColor")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPress(_ sender: Any) {
        
       // performSegue(withIdentifier: "BedAlarmSegue", sender: self)
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        formatter.dateStyle = .none
//        formatter.dateFormat = "MMM d, h:mm a"
//        bedTimeDatePicker.datePickerMode = UIDatePicker.Mode.time
//         let date = formatter.string(from: bedTimeDatePicker.date)
//        //delegate?.addBedTimmings(time: date, dateP: bedTimeDatePicker)
//        self.view.endEditing(true)

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AlarmViewController") as! AlarmViewController
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .none
        formatter.dateFormat = "h:mm a"
        bedTimeDatePicker.datePickerMode = UIDatePicker.Mode.time
         let date = formatter.string(from: bedTimeDatePicker.date)
        print(date)
        self.view.endEditing(true)
        newViewController.date = date
        newViewController.datePicker = bedTimeDatePicker
        self.present(newViewController, animated: true, completion: nil)

    }
    
    @IBAction func skipPressed(_ sender: Any) {
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
