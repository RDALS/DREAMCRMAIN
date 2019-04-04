//
//  MainVC-M.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/04/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit

class MainVC_M: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ShowAppSetting), name: NSNotification.Name("ShowAppSettings"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ShowLogOut), name: NSNotification.Name("ShowLogOut"), object: nil)
        
    }
    // Toggling between menuItems
   @objc func showProfile() {
        performSegue(withIdentifier: "ShowProfile", sender: nil)
        
    }
    @objc func ShowAppSetting() {
        performSegue(withIdentifier: "ShowAppSetting", sender: nil)

        
    }
    @objc func ShowLogOut() {
        performSegue(withIdentifier: "ShowLogOut", sender: nil)

        
    }
    
    @IBAction func onTapped() {
        
        print("ToggleSideMenu")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleMenu"), object: nil)
        
        
    }
}
