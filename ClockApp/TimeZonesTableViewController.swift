//
//  TimeZonesTableViewController.swift
//  ClockApp
//
//  Created by IT on 10/23/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit
protocol worldClockProtocol {
    func addTimeZone(timeZone : String)
}

class TimeZonesTableViewController: UITableViewController , UISearchBarDelegate{
    
    var delegate : worldClockProtocol?
    // MARK: IB outlets
    
    @IBOutlet weak var searchText: UISearchBar!
    
    var timeZones :[String] = []
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.delegate = self
        timeZones = NSTimeZone.knownTimeZoneNames
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeZones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = timeZones[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTimeZone = timeZones[indexPath.row]
        delegate?.addTimeZone(timeZone: selectedTimeZone)
        self.dismiss(animated: true, completion: nil)
    }
   override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           cell.backgroundColor = .clear
           cell.textLabel?.textColor = .lightGray
    cell.selectionStyle = .gray
       }
    
    // MARK: UISearchBAr Delegates Methods
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            timeZones = NSTimeZone.knownTimeZoneNames.filter { $0.contains(searchText) }
        }
        else{
            timeZones = NSTimeZone.knownTimeZoneNames
            
        }
        tableView.reloadData()
    }

}
