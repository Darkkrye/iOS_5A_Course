//
//  NumberRowController.swift
//  MyFirstWatchApp
//
//  Created by Pierre on 12/09/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import Foundation
import UIKit
import WatchKit

class NumberRowController: NSObject {
    
    @IBOutlet var numberLabel: WKInterfaceLabel!
    
    public func setLabelText(_ number: Int) {
        self.numberLabel.setText(String(number))
    }
}
