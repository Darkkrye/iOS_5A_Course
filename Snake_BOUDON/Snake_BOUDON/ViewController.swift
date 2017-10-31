//
//  ViewController.swift
//  Snake_BOUDON
//
//  Created by Pierre on 31/10/2017.
//  Copyright © 2017 boudonpierre. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    var currentDirection = DIRECTION.top
    var snakeHeight = CGFloat(10.0)
    var snakeWidth = CGFloat(10.0)
    var snakeDeplacement = CGFloat(1.0)
    
    var timer: Timer!
    var screenSize = UIScreen.main.bounds.size

    @IBOutlet weak var snakeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.red.cgColor
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    @objc func startGame() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.moveView), userInfo: nil, repeats: true)
            self.timer.fire()
        }
    }
    
    @objc func pauseGame() {
        self.timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func moveView() {
        
        // Déplacement
        switch self.currentDirection {
        case .top:
            self.snakeView.frame.origin.y -= snakeDeplacement
            
        case .bottom:
            self.snakeView.frame.origin.y += snakeDeplacement
            
        case .right:
            self.snakeView.frame.origin.x += snakeDeplacement
            
        case .left:
            self.snakeView.frame.origin.x -= snakeDeplacement
        }
        
        // Retour de l'autre côté de l'écran
        if self.snakeView.frame.origin.y < 0 {
            self.snakeView.frame.origin.y = screenSize.height
        } else if self.snakeView.frame.origin.y > screenSize.height {
            self.snakeView.frame.origin.y = 0
        } else if self.snakeView.frame.origin.x > screenSize.width {
            self.snakeView.frame.origin.x = 0
        } else if self.snakeView.frame.origin.x < 0 {
            self.snakeView.frame.origin.x = screenSize.width
        }
    }
}

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        if let direction = message["direction"] as? String {
            self.currentDirection = DIRECTION.getEnum(s: direction)
        } else if let action = message["action"] as? String {
            /*let ui = UIAlertController(title: "Title", message: action, preferredStyle: .alert)
            let uia = UIAlertAction(title: "Title", style: .cancel, handler: nil)
            ui.addAction(uia)
            self.present(ui, animated: true, completion: nil)*/
            
            if action == "Start" {
                self.startGame()
            } else {
                self.pauseGame()
            }
        }
    }
}
