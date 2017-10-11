//
//  ViewController.swift
//  WatchAppContext
//
//  Created by Pierre on 11/10/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var textFieldTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchSubmit(_ sender: Any) {
        if WCSession.isSupported() {
            let session = WCSession.default
            guard
                session.isPaired && session.isWatchAppInstalled,
                let firstName = self.textFieldTF.text else {
                    return
            }
            
            do {
                try session.updateApplicationContext(["prenom" : firstName])
            } catch {
                print("ERREUR => \(error.localizedDescription)")
            }
        }
    }
    
}

