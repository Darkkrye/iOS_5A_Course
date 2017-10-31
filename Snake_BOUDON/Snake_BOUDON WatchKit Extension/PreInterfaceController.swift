//
//  PreInterfaceController.swift
//  Snake_BOUDON WatchKit Extension
//
//  Created by Pierre on 31/10/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import UIKit
import WatchKit
import WatchConnectivity

class PreInterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    @IBAction func startGameButtonTapped() {
        self.sendMessage(key: "action", value: "Start")
        self.presentController(withName: "InterfaceController", context: nil)
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

extension PreInterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
}
