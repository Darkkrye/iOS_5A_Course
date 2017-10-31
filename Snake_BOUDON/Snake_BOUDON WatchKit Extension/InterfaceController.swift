//
//  InterfaceController.swift
//  Snake_BOUDON WatchKit Extension
//
//  Created by Pierre on 31/10/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }

        /* To remove cancel or back button => Bug with Force Touch on simulator */
        // WKInterfaceController.reloadRootControllers(withNamesAndContexts: [("InterfaceController", "" as AnyObject)])
    }
    
    override func didAppear() {
        super.didAppear()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    /*
     * FOR FORCE TOUCH ON PLAY SCREEN
     */
    @IBAction func pauseGameButtonTapped() {
        self.sendMessage(key: "action", value: "Pause")
        // self.dismiss()
    }
    
    @IBAction func topButtonTapped() {
        self.sendMessage(key: "direction", value: "Top")
    }
    
    @IBAction func bottomButtonTapped() {
        self.sendMessage(key: "direction", value: "Bottom")
    }
    
    @IBAction func rightButtonTapped() {
        self.sendMessage(key: "direction", value: "Right")
    }
    
    @IBAction func leftButtonTapped() {
        self.sendMessage(key: "direction", value: "Left")
    }
    
    public func sendMessage(key: String, value: String) {
        let session = WCSession.default
        guard session.isReachable else {
            return
        }
        session.sendMessage([
            key: value
        ], replyHandler: nil, errorHandler: nil)
        
        print(value)
    }
}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
}
