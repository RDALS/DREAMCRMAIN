//
//  ProfileSettingsViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 10/04/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileSettingsViewController: UIViewController {

    var refUser : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
          refUser = Database.database().reference().child("Users")
    }
    
    
    
   
    
    func setupProfile() {
        
        
        
        
    }
    
    
    // Code To save
        
        
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
