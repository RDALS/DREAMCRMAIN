//
//  MainVC-M.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/04/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit

class MainVC_M: UIViewController {

    
    @IBAction func onTapped() {
        
        print("ToggleSideMenu")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleMenu"), object: nil)
        
        
    }
}
