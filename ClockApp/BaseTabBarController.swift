//
//  BaseTabBarController.swift
//  ClockApp
//
//  Created by IT on 10/28/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = self.view.bounds.width
               let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 64))
               self.view.addSubview(navigationBar)
        navigationBar.barTintColor = UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1)
        let navigationItem = UINavigationItem()
        navigationItem.title = "Clock"

        //navigationBar.topItem?.title = "Clock"
//                  let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(selectorX))
//                  navigationItem.rightBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
        
    }
           @objc func selectorX() { }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


