//
//  DetailInterfaceController.swift
//  MyFirstWatchApp
//
//  Created by Pierre on 12/09/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet var myLabel: WKInterfaceLabel!
    @IBOutlet var numberTable: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        self.setTitle("Details")
        /*if let c = context as? [String: String] {
            self.details = c["label"]!
        }*/
        
        // guard let ctx = context as? [String: Any] else { return }
        // self.details = ctx["label"] as! String
        
        guard let ctx = context as? [String: Any],
            let title = ctx["label"] as? String else { return }
        
        self.myLabel.setText(title)
        self.myLabel.setTextColor(UIColor.red)
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.numberTable.setNumberOfRows(50, withRowType: "MySuperRow")
        for i in 0..<self.numberTable.numberOfRows {
            /*let row = self.numberTable.rowController(at: i) as! NumberRowController
            row.setLabelText(i)*/
            
            guard let controller = self.numberTable.rowController(at: i) as? NumberRowController else { return }
            controller.setLabelText(i)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
