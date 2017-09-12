//
//  InterfaceController.swift
//  MyFirstWatchApp WatchKit Extension
//
//  Created by Pierre on 12/09/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var b = true
    @IBOutlet var myButton: WKInterfaceButton!
    @IBOutlet var myImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func myButtonTapped() {
        if b {
            self.myImage.setImage(#imageLiteral(resourceName: "image"))
        } else {
            self.myImage.setImage(#imageLiteral(resourceName: "apres"))
        }
        b = !b
    }
}
