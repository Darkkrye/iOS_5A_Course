//
//  ViewController.swift
//  UserInfoTransfer
//
//  Created by Pierre on 31/10/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendToAppleWatchTapped(_ sender: Any) {
        let session = WCSession.default
        guard session.isPaired && session.isWatchAppInstalled else {
            return
        }
        guard let name = self.nameTF.text else { return }
        session.transferUserInfo(["name": name])
    }
    
    @IBAction func sendImageTapped(_ sender: Any) {
        let session = WCSession.default
        guard session.isPaired && session.isWatchAppInstalled else {
            return
        }
        guard let path = Bundle.main.url(forResource: "maul", withExtension: "png") else {
            return
        }
        session.transferFile(path, metadata: nil)
    }
}

extension ViewController: WCSessionDelegate {
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
