//
//  RoundButton.swift
//  ClockApp
//
//  Created by IT on 10/22/20.
//  Copyright © 2020 IT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton :Bool = false{
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height/2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        layer.cornerRadius = frame.height/2
    }
}
