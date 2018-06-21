//
//  ViewController.swift
//  AlertsBasics
//
//  Created by Administrator on 6/21/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnInputAlert: UIButton!
    @IBOutlet weak var btnAlert: UIButton!
    @IBOutlet weak var btnMultiAlert: UIButton!
    @IBOutlet weak var userOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btn_actionInputAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Email Address",
                                                message: "Please enter your email address below:",
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField(configurationHandler: {(emailField)in
            emailField.text=""
            emailField.placeholder="Email:"
            emailField.isSecureTextEntry=true
        })
        
        alertController.addAction(UIAlertAction(title:"OK",style:.default,
                                                handler: {[weak alertController](_) in
                                                    let emailField = alertController?.textFields![0]
                                                    
                                                    let email = emailField?.text
                                                    self.userOutput.text="Entered:\(email!)"
        }))
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btn_actionMultiAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert with Buttos Selected",
                                                message:"Options are good for people!",
                                                preferredStyle: UIAlertControllerStyle.alert)
        let nowAction = UIAlertAction(title: "Do something Now",
                                      style: UIAlertActionStyle.default,
                                      handler:{alert in self.userOutput.text="Pressed Now"})
        let laterAction = UIAlertAction(title: "Do something later",
                                      style: UIAlertActionStyle.default,
                                      handler:{alert in self.userOutput.text="Pressed Later"})
        let cancelAction = UIAlertAction(title: "Never do it!",
                                      style: UIAlertActionStyle.default,
                                      handler:{alert in self.userOutput.text="Pressed Never"})
        
        alertController.addAction(nowAction)
        alertController.addAction(laterAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btn_actionAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Simple Single Alert",
                                                message:"This is just a simple alert",
                                                preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.cancel,
                                          handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController,animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

